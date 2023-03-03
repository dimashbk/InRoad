//
//  HomeViewController.swift
//  InRoad
//
//  Created by Dinmukhamed on 18.02.2023.
//

import UIKit
import GoogleMaps
import SnapKit

final class HomeViewController: UIViewController {
    
    let items = ["Точки",
                 "Цветовые схемы"]
    
    private lazy var plusZoom: UIButton = {
        
        let plusZoom = UIButton()
        plusZoom.setBackgroundImage(UIImage(named: "Plus"), for: .normal)
        
        return plusZoom
    }()
    private lazy var minusZoom: UIButton = {
        
        let minusZoom = UIButton()
        minusZoom.setBackgroundImage(UIImage(named: "Minus"), for: .normal)
        
        return minusZoom
    }()
    private lazy var myLocation: UIButton = {
        
        let myLocation = UIButton()
        myLocation.setBackgroundImage(UIImage(named: "myLocation"), for: .normal)
        myLocation.addTarget(self, action: #selector(showMyLocation), for: .touchUpInside)
        
        return myLocation
    }()
    private lazy var viewToSC: UIView = {
        
        let viewToSC = UIView()
        viewToSC.addSubview(segControl)
        return viewToSC
    }()
    private lazy var segControl: UISegmentedControl = {
        
        var segControl = UISegmentedControl()
        segControl = UISegmentedControl(items: items)
        segControl.removeBorder()
        segControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.tabBarItemAccent], for: .selected)
        segControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.459,
                                                                                           green: 0.459,
                                                                                           blue: 0.459,
                                                                                           alpha: 1)],
                                                                                           for: .normal)
        segControl.selectedSegmentIndex = 0
        //        let attr = NSDictionary(object: UIFont(name: "Stolzl-Regular", size: 14.0)!, forKey: NSAttributedString.Key.font as NSCopying)
        //        segControl.setTitleTextAttributes(attr as? [NSAttributedString.Key : Any] , for: .normal)
        
        return segControl
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        setUpGoogleMaps()
        initialize()
        makeConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureViewLayer()
    }
    
    private func configureViewLayer(){
        viewToSC.layer.masksToBounds = false
        viewToSC.layer.cornerRadius = 16
        viewToSC.layer.shadowRadius = 4
        viewToSC.layer.shadowOpacity = 1
        viewToSC.layer.shadowColor = UIColor(red: 0,
                                             green: 0,
                                             blue: 0,
                                             alpha:0.15).cgColor
    }
    
    private func setUpGoogleMaps(){
        
        GMSServices.provideAPIKey("AIzaSyCDM2tOxkbG3s2FifKxEZPwSIMSUZveaT8")
        
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
    private func makeConstraints(){
        viewToSC.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(46)
        }
        plusZoom.snp.makeConstraints { make in
            make.width.height.equalTo(46)
            make.top.equalToSuperview().inset(343)
            make.right.equalToSuperview().inset(12)
        }
        minusZoom.snp.makeConstraints { make in
            make.width.height.equalTo(46)
            make.top.equalTo(plusZoom.snp.bottom).offset(10)
            make.right.equalToSuperview().inset(12)
        }
        myLocation.snp.makeConstraints { make in
            make.width.height.equalTo(46)
            make.top.equalTo(minusZoom.snp.bottom).offset(10)
            make.right.equalToSuperview().inset(12)
        }
        segControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func initialize(){
        view.addSubview(viewToSC)
        view.addSubview(plusZoom)
        view.addSubview(minusZoom)
        view.addSubview(myLocation)
    }
    @objc func showMyLocation(){
        //        mapView.isMyLocationEnabled = true
        print("my location")
    }
    
    
    
    
}
