//
//  ccMapViewController.swift
//  ssEfect
//
//  Created by gaoyong
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

import UIKit
import MapKit

class ccMapViewController: UIViewController {

    var mapView : MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mapView = MKMapView(frame: self.view.bounds)
        mapView.isScrollEnabled = false
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2DMake(23.134844, 113.317290)
//        mapView.showsUserLocation = true;
        self.view.addSubview(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
