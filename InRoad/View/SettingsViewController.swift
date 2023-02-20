//
//  SettingsViewController.swift
//  InRoad
//
//  Created by Dinmukhamed on 18.02.2023.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let tableView = UITableView()
    let feedbackButton = UIButton()
    let cellId = "au"
    let settings = ["Режим пользования","Тип автомобиля","Изменить город","Выбрать язык приложения"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SettingsCell.self, forCellReuseIdentifier: cellId)
        initilize()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
           // #warning Incomplete implementation, return the number of sections
           return 1
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SettingsCell
        cell.label.text = settings[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 64
        }
    
    private func initilize(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(feedbackButton)
        feedbackButton.backgroundColor = .tabBarItemAccent
        feedbackButton.layer.cornerRadius = 16
        feedbackButton.setTitle("Написать отзыв", for: .normal)
        feedbackButton.addTarget(self, action: #selector(toFeedback), for: .touchUpInside)
        feedbackButton.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.width.equalTo(352)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(661)
        }
    }
    @objc func toFeedback(){
        print("feedback")
    }
    
}


