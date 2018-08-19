//
//  MapTableViewCell.swift
//  Milu
//
//  Created by Admin on 8/19/18.
//  Copyright © 2018 Admintest. All rights reserved.
//

import UIKit
import MapKit
import APAvatarImageView

class MapTableViewCell: UITableViewCell,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var eventImageView: APAvatarImageView!
    
    var locationManager : CLLocationManager = CLLocationManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mapView_init()
        eventImageView.borderWidth = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func mapView_init(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        self.mapView.delegate = self
        self.mapView.isZoomEnabled = true
        self.mapView.isScrollEnabled = true
        self.mapView.isUserInteractionEnabled = false
        
        let location = CLLocation(latitude: 48.851760,longitude: 2.340578)
 
        
        let regionRadius: CLLocationDistance = 500
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
      
        
        var legalLabel: UIView?
        for subview in mapView.subviews {
            if String(describing: type(of: subview)) == "MKAttributionLabel" {
                legalLabel = subview
            }
        }
        legalLabel?.isHidden = true
        
        
    }
}
