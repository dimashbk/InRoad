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
    
    
    
    var segControl = UISegmentedControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGoogleMaps()
        view.backgroundColor = .white
        initialize()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        segControl.layer.cornerRadius = 16
        segControl.clipsToBounds = false
        segControl.layer.masksToBounds = false
        segControl.layer.shadowRadius = 4
        segControl.layer.shadowOpacity = 1
        segControl.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        segControl.layer.shadowPath = UIBezierPath(roundedRect: segControl.bounds, cornerRadius: 16).cgPath
    }


    private func setUpGoogleMaps(){
        GMSServices.provideAPIKey("...")

        let camera = GMSCameraPosition.camera(withLatitude: 43.22126814174525,
                                              longitude:    76.85327279571138,
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
        let items = ["Точки",
                     "Цветовые схемы"]
        segControl = UISegmentedControl(items: items)
        
        segControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.tabBarItemAccent],
                                          for: .selected)
        segControl.selectedSegmentIndex = 0
        segControl.removeBorder()
        view.addSubview(segControl)
        segControl.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(46)
        }
    }
    


}
