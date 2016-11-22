//
//  MapViewController.swift
//  KOM_Project
//
//  Created by GuoGongbin on 11/22/16.
//  Copyright © 2016 GuoGongbin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var task1 = Task(summary: "this is task1 summary", location: CLLocationCoordinate2D(latitude: 49.8764, longitude: 8.6572), priority: 1)
    
    var task2 = Task(summary: "this is task2 summary", location: CLLocationCoordinate2D(latitude: 49.875452, longitude: 8.656621), priority: 2)
    var task3 = Task(summary: "this is task3 summary", location: CLLocationCoordinate2D(latitude: 49.874796, longitude:8.656234), priority: 3)
    
    var tasks = [Task]()
    
    let center = CLLocationCoordinate2D(latitude: 49.872824, longitude: 8.650608)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = [task1, task2, task3]
        mapView.delegate = self

        // Do any additional setup after loading the view.
        
        //let region = MKCoordinateRegion(center: task.location, span: <#T##MKCoordinateSpan#>)
        let locationDistance: CLLocationDistance = 4000
        let region = MKCoordinateRegionMakeWithDistance(center, locationDistance, locationDistance)
        mapView.setRegion(region, animated: true)
        
        mapView.addAnnotations(tasks)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
