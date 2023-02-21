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
    
    let plusZoom = UIButton()
    let minusZoom = UIButton()
    let myLocation = UIButton()
    let viewToSC = UIView()
    var segControl = UISegmentedControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGoogleMaps()
        initialize()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewToSC.layer.shadowRadius = 4
        viewToSC.layer.shadowOpacity = 1
        viewToSC.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        viewToSC.layer.shadowPath = UIBezierPath(roundedRect: viewToSC.bounds, cornerRadius: 16).cgPath
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
        view.addSubview(viewToSC)
        viewToSC.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(46)
        }
        let items = ["Точки",
                     "Цветовые схемы"]
        segControl = UISegmentedControl(items: items)
        
        segControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.tabBarItemAccent],
                                          for: .selected)
        segControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)],
                                          for: .normal)
        segControl.selectedSegmentIndex = 0
        segControl.removeBorder()
        viewToSC.addSubview(segControl)
        segControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(plusZoom)
        plusZoom.setBackgroundImage(UIImage(named: "Plus"), for: .normal)
        plusZoom.snp.makeConstraints { make in
            make.width.height.equalTo(46)
            make.top.equalToSuperview().inset(343)
            make.right.equalToSuperview().inset(13)
        }
        view.addSubview(minusZoom)
        minusZoom.setBackgroundImage(UIImage(named: "Minus"), for: .normal)
        minusZoom.snp.makeConstraints { make in
            make.width.height.equalTo(46)
            make.top.equalTo(plusZoom.snp.bottom).offset(10)
            make.right.equalToSuperview().inset(13)
        }
        view.addSubview(myLocation)
        myLocation.setBackgroundImage(UIImage(named: "myLocation"), for: .normal)
        myLocation.snp.makeConstraints { make in
            make.width.height.equalTo(46)
            make.top.equalTo(minusZoom.snp.bottom).offset(10)
            make.right.equalToSuperview().inset(13)
        }
        myLocation.addTarget(self, action: #selector(showMyLocation), for: .touchUpInside)
        
        
    }
    @objc func showMyLocation(){
//        mapView.isMyLocationEnabled = true
        print("my location")
    }
    


}
