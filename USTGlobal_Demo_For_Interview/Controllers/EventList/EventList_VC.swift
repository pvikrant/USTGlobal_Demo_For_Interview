//
//  EventList_VC.swift
//  USTGlobal_Interview_Demo
//
//  Created by AppEdify TechnoWorld on 27/02/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import UIKit


class EventList_VC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // MARK: Properties
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var viewOfHeader: UIView!
        {
            didSet
            {
                viewOfHeader.backgroundColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Main_Color)
            }
        }
    
    @IBOutlet weak var lblTitle: UILabel!
        {
            didSet
            {
                
                lblTitle.text = "Google Events"
                lblTitle.textColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Color_White)
            }
        }
    @IBOutlet weak var viewForButtons: UIView!
        {
            didSet
            {
                viewForButtons.backgroundColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Main_Color)
            }
        }
    @IBOutlet weak var btnCurrentUpcoming: UIButton!
        {
            didSet
            {
                btnCurrentUpcoming.setTitleColor(UIColor.GetColor(fromHEX: Utilities.shared.App_Color_White), for: .normal)
                    
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
                lblMonthStatus.textColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Text_Color)
                
            }
        }
    @IBOutlet weak var btnPast: UIButton!
        {
            didSet
                
            {
                btnPast.setTitleColor(UIColor.GetColor(fromHEX: Utilities.shared.App_Color_White), for: .normal)
                
            }
        }
    @IBOutlet weak var viewOfPastBorder: UIView!
    @IBOutlet weak var tblEventList: UITableView!
    
    //MARK: Object Declaration
    
    var arrOfEventsDetails = [EventModel]()
    var selectedActionTag = Int()
    let date = Date()
    let format = DateFormatter()
    
    // MARK: Init
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        selectedActionTag = 1
        loadData()
        
        viewOfCurrentUpcomingBorder.isHidden = false
        
    }
    
    // MARK: Get data from Json
    
    func loadData()
    {
        arrOfEventsDetails.removeAll()
        
        var url1:URL?
        
        if selectedActionTag == 1
        {
            if let url = Bundle.main.url(forResource: "UpcomingEvents", withExtension: "json") {
                
                url1 = url
            }
        }
        else
        {
            if let url = Bundle.main.url(forResource: "PastEvents", withExtension: "json") {
            
                url1 = url
            }
        }
        
        if let finalURl = url1
        {
            ConvertJsonToSwiftObject(finalURl)
        }
    }
    
    fileprivate func ConvertJsonToSwiftObject(_ finalURl: URL) {
        let decoder = JSONDecoder()
        
        do {
            let jsonString = try String(contentsOf: finalURl)
            let jsonData = Data(jsonString.utf8)
            let people = try decoder.decode([EventModel].self, from: jsonData)
            print(people)
            arrOfEventsDetails.append(contentsOf: people)
        } catch {
            debugPrint(error)
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "Events_Cell") as! Events_Cell
        
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
        loadData()
        tblEventList.reloadData()
    }
    
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


