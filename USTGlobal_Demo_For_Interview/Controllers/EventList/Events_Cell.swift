

//
//  Events_Cell.swift
//  USTGlobal_Interview_Demo
//
//  Created by AppEdify TechnoWorld on 01/03/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import UIKit

class Events_Cell: UITableViewCell
{
    @IBOutlet weak var viewOfBackground: UIView!
    @IBOutlet weak var imgEvent: UIImageView!
    @IBOutlet weak var lblEventTitle: UILabel!
        {
            didSet
            {
                self.lblEventTitle.textColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Text_Color)
                
            }
        }
    @IBOutlet weak var lblEventLocation: UILabel!
        {
            didSet
            {
                self.lblEventLocation.textColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Text_Color)
            }
        }
    @IBOutlet weak var lblEventTime: UILabel!
        {
            didSet
            {
                self.lblEventTime.textColor = UIColor.GetColor(fromHEX: Utilities.shared.App_Text_Color)
            }
        }
    
}

extension Events_Cell
{
    func setEventsCell(_ from:EventModel)
        {
            // MARK: UITableViewCell
            self.imgEvent.image = UIImage.init(named:"event\(from.event_id)" )
            self.lblEventTitle.text = from.event_title
            self.lblEventLocation.text = from.event_location
            self.lblEventTime.text = from.event_time
        }
}
