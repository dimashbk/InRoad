//
//  FeedbackViewController.swift
//  InRoad
//
//  Created by Dinmukhamed on 23.02.2023.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    var label = UILabel()
    var nameTextField = UITextField()
    var numberTextField = UITextField()
    var mailTextField = UITextField()
    var messegeTextField = UITextField()
    var sendFeedback = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initialize()
    }
    

    private func initialize(){
        view.addSubview(label)
        label.numberOfLines = 0
        label.text = "Оставьте отзыв, чтобы повлиять на качество дорог в республике"
        label.textColor = UIColor(red: 0.204, green: 0.204, blue: 0.204, alpha: 1)
        label.font = UIFont(name: "Stolzl-Regular", size: 20)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(19)
        }
        
        view.addSubview(nameTextField)
        nameTextField.layer.cornerRadius = 16
        nameTextField.layer.borderColor = UIColor(red: 0.938, green: 0.938, blue: 0.938, alpha: 1).cgColor
        nameTextField.layer.borderWidth = 2
        nameTextField.placeholder = "      Ваше имя"
        nameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(352)
            make.height.equalTo(54)
            make.top.equalTo(label.snp.bottom).offset(26)
        }
        view.addSubview(numberTextField)
        numberTextField.layer.cornerRadius = 16
        numberTextField.layer.borderColor = UIColor(red: 0.938, green: 0.938, blue: 0.938, alpha: 1).cgColor
        numberTextField.layer.borderWidth = 2
        numberTextField.backgroundColor = .white
        numberTextField.placeholder = "      Номер Телефона"
        numberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(352)
            make.height.equalTo(54)
            make.top.equalTo(nameTextField.snp.bottom).offset(14)
        }
        view.addSubview(mailTextField)
        mailTextField.layer.cornerRadius = 16
        mailTextField.backgroundColor = .white
        mailTextField.layer.borderColor = UIColor(red: 0.938, green: 0.938, blue: 0.938, alpha: 1).cgColor
        mailTextField.layer.borderWidth = 2
        mailTextField.placeholder = "      Электронная почта"
        mailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(352)
            make.height.equalTo(54)
            make.top.equalTo(numberTextField.snp.bottom).offset(14)
        }
        view.addSubview(messegeTextField)
        messegeTextField.layer.cornerRadius = 16
        messegeTextField.backgroundColor = .white
        messegeTextField.layer.borderColor = UIColor(red: 0.938, green: 0.938, blue: 0.938, alpha: 1).cgColor
        messegeTextField.layer.borderWidth = 2
//        messegeTextField.placeholder = "      Сообщение"
        messegeTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(352)
            make.height.equalTo(110)
            make.top.equalTo(mailTextField.snp.bottom).offset(14)
        }
        view.addSubview(sendFeedback)
        sendFeedback.backgroundColor = .tabBarItemAccent
        sendFeedback.layer.cornerRadius = 16
        sendFeedback.setTitle("Отправить отзыв", for: .normal)
        sendFeedback.titleLabel?.font = UIFont(name: "Stolzl-Medium", size: 16)
        sendFeedback.snp.makeConstraints { make in
            make.height.equalTo(53)
            make.width.equalTo(352)
            make.centerX.equalToSuperview()
            make.top.equalTo(messegeTextField.snp.bottom).offset(26)
        }
    }
}
