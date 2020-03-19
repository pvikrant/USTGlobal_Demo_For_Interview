//
//  EventModel.swift
//  USTGlobal_Interview_Demo
//
//  Created by AppEdify TechnoWorld on 01/03/2020.
//  Copyright © 2020 AppEdify TechnoWorld. All rights reserved.
//

import Foundation

struct Event_Listing_Model: Codable
{
    var event_id: String
    var event_title: String
    var event_location: String
    var event_time: String
}

func getEventObjectWith(finalURl: URL, completion: @escaping (_ data: [Event_Listing_Model], _ error: Error?) -> Void)
 {
    let decoder = JSONDecoder()
    do {
        let jsonString = try String(contentsOf: finalURl)
        let jsonData = Data(jsonString.utf8)
        let events = try decoder.decode([Event_Listing_Model].self, from: jsonData)
        return completion(events, nil)
    } catch
    {
        debugPrint(error)
    }
}
