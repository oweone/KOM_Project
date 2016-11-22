//
//  TaskDescriptionViewController.swift
//  KOM_Project
//
//  Created by GuoGongbin on 11/22/16.
//  Copyright © 2016 GuoGongbin. All rights reserved.
//

import UIKit
import MapKit

class TaskDescriptionViewController: UIViewController, MKMapViewDelegate {
    
    var task: Task!
    
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var priority: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        summary.text = task.summary
        priority.text = "\(task.priority)"
        
        //let region = MKCoordinateRegion(center: task.location, span: <#T##MKCoordinateSpan#>)
        let locationDistance: CLLocationDistance = 1000
        let region = MKCoordinateRegionMakeWithDistance(task.coordinate, locationDistance, locationDistance)
        mapView.setRegion(region, animated: true)
        
        mapView.addAnnotation(task)
        

        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var view: MKPinAnnotationView
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            dequeueView.annotation = annotation
            view = dequeueView
        }else{
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
        }
        return view
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
