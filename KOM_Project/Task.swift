//
//  Task.swift
//  KOM_Project
//
//  Created by GuoGongbin on 11/22/16.
//  Copyright © 2016 GuoGongbin. All rights reserved.
//

import Foundation
import MapKit

class Task: NSObject, MKAnnotation {
    
    //1. All tasks are associated with geographical information (Location), which is reused in the matching process to assign tasks to workers based on their current location.
    //2. description, location, vicinity, reward, priority, expired, assigned, solution, submission
    
    var summary: String
    var location: CLLocationCoordinate2D
//    var reward: Double
    var priority: Double
    var title: String? {
        return summary
    }
    var subtitle: String? {
        return "priority: \(priority)"
    }
    var coordinate: CLLocationCoordinate2D {
        return location
    }
    
    
    init(summary: String, location: CLLocationCoordinate2D, priority: Double) {
        self.summary = summary
        self.location = location
        self.priority = priority
    }
    
}
