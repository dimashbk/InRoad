//
//  HomeViewController.swift
//  InRoad
//
//  Created by Dinmukhamed on 18.02.2023.
//

import UIKit
import GoogleMaps
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        googleMaps()
    }
    func googleMaps(){
        GMSServices.provideAPIKey("AIzaSyCDM2tOxkbG3s2FifKxEZPwSIMSUZveaT8")
        let camera = GMSCameraPosition.camera(withLatitude: -33.86,                                                  longitude:151.20,
                                              zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview (mapView)
        let marker = GMSMarker ()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    


}
