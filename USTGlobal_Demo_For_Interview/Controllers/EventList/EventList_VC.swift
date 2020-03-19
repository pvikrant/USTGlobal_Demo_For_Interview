//
//  EventList_VC.swift
//  USTGlobal_Interview_Demo
//
//  Created by AppEdify TechnoWorld on 27/02/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import UIKit


class EventList_VC: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    // MARK: Properties
    
    @IBOutlet weak var viewOfBackground: UIView!
        {
            didSet
            {
                viewOfBackground.backgroundColor = Theme.currentTheme.app_Background
            }
        }
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var viewOfHeader: UIView!
        {
            didSet
            {
                viewOfHeader.backgroundColor = Theme.currentTheme.App_Main_Color
            }
        }
    @IBOutlet weak var lblTitle: UILabel!
        {
            didSet
            {
                lblTitle.text = "Google Events"
                lblTitle.textColor = Theme.currentTheme.app_Tint
            }
        }
    @IBOutlet weak var viewForButtons: UIView!
        {
            didSet
            {
                viewForButtons.backgroundColor = Theme.currentTheme.App_Main_Color
            }
        }
    @IBOutlet weak var btnCurrentUpcoming: UIButton!
        {
            didSet
            {
                btnCurrentUpcoming.setTitleColor(Theme.currentTheme.app_Tint, for: .normal)
            }
    }
    @IBOutlet weak var viewOfCurrentUpcomingBorder: UIView!
    @IBOutlet weak var viewOfMonthStatus: UIView!
        {
            didSet
            {
                viewOfMonthStatus.layer.cornerRadius = 5
                viewOfMonthStatus.layer.masksToBounds = true
            }
        }
    @IBOutlet weak var lblMonthStatus: UILabel!
        {
            didSet
            {
                format.dateFormat = "MMMM YYYY"
                lblMonthStatus.text = "\(format.string(from: date))"
                lblMonthStatus.textColor = Theme.currentTheme.App_Text_Color
            }
        }
    @IBOutlet weak var btnPast: UIButton!
        {
            didSet
            {
                btnPast.setTitleColor(Theme.currentTheme.app_Tint, for: .normal)
            }
    }
    @IBOutlet weak var viewOfPastBorder: UIView!
    @IBOutlet weak var tblEventList: UITableView!
    
    
    //MARK: Object Declaration
    
    var arrOfEventsDetails = [Event_Listing_Model]()
    var selectedActionTag = Int()
    let date = Date()
    let format = DateFormatter()
    
    // MARK: Init
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        selectedActionTag = 1
        loadJson()
        viewOfCurrentUpcomingBorder.isHidden = false
    }
    
    // MARK: Get data from Json
    
    func loadJson()
    {
        arrOfEventsDetails.removeAll()
        var finalURl:URL?
        
        if selectedActionTag == 1
        {
            finalURl = Bundle.main.url(forResource: "UpcomingEvents", withExtension: "json")
        }
        else
        {
            finalURl = Bundle.main.url(forResource: "PastEvents", withExtension: "json")
        }
        
        getEventObjectWith(finalURl: finalURl!){ (data, error) in
                self.arrOfEventsDetails = data
            }
    }

    // MARK: TableView Delegate & Datasource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if selectedActionTag == 1
        {
            return arrOfEventsDetails.count
        }
        else
        {
            return arrOfEventsDetails.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Events_Listing_Cell") as! Events_Listing_Cell
        
        cell.setEventsCell(arrOfEventsDetails[indexPath.row])
        return cell
    }
    // MARK: Controllers
    
    @IBAction func btnSelectEventOption(_ sender: Any)
    {
        let color = UIColor.init(red: 2, green: 31, blue: 95, alpha: 1)
        
        viewOfCurrentUpcomingBorder.backgroundColor = UIColor.clear
        viewOfPastBorder.backgroundColor = UIColor.clear
        selectedActionTag = (sender as AnyObject).tag
        
        if (sender as AnyObject).tag == 1
        {
            viewOfCurrentUpcomingBorder.backgroundColor = color
        }
        else
        {
            viewOfPastBorder.backgroundColor = color
        }
        loadJson()
        tblEventList.reloadData()
    }
    
    @IBAction func btnMenuAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSettingAction(_ sender: Any){ }
}


