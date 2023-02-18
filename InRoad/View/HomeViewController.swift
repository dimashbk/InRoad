//
//  HomeViewController.swift
//  InRoad
//
//  Created by Dinmukhamed on 18.02.2023.
//

import UIKit
import GoogleMaps
import SnapKit

class HomeViewController: UIViewController {
    let items = ["Точки",
                 "Cветовые схемы"]
    var segmentControl: UISegmentedControl{
        let control = UISegmentedControl(items: items)
        return control
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGoogleMaps()
        initialize()
    }

    private func setUpGoogleMaps(){
        GMSServices.provideAPIKey("AIzaSyCDM2tOxkbG3s2FifKxEZPwSIMSUZveaT8")
        
        let camera = GMSCameraPosition.camera(withLatitude: 43.22126814174525,                                                                             longitude:    76.85327279571138,
                                              zoom:         15.0)
        let mapView = GMSMapView.map(withFrame:             view.frame,
                                     camera:                camera)
        view.addSubview(mapView)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude:  43.22126814174525,
                                                 longitude: 76.85327279571138)
        marker.title = "Almaty"
        marker.snippet = "Kazakhstan"
        marker.map = mapView
    }
    private func initialize(){
        view.addSubview(segmentControl)
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
    }
    


}
