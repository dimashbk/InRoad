//
//  SettingsViewController.swift
//  InRoad
//
//  Created by Dinmukhamed on 18.02.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    let items = ["Точки",
                 "Cветовые схемы"]
    var segmentControl: UISegmentedControl{
        let control = UISegmentedControl(items: items)
        return control
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(segmentControl)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
