//
//  MainViewController.swift
//  YesOrNo
//
//  Created by Misha Samoylov on 08.02.2022.
//

import UIKit

class MainViewController: UIViewController {

    var label: UILabel = UILabel()
    var clearTimer: Timer = Timer()
    var button: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.systemBackground

        label = UILabel(frame: .zero)
        label.text = "Я помогу вам с решением любых вопросов. Загадайте вопрос, нажмите ОК и узнайте ответ."
        label.numberOfLines = 5
        label.textAlignment = .center
        
        self.view.addSubview(label)
        
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.addTarget(self, action: #selector(touchButton), for: .touchDown)
        
        self.view.addSubview(button)

        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func touchButton() {
        let number = Int.random(in: 1..<5)
        var result: String
               
        switch number {
        case 1:
            result = "Ответ: Да"
            self.view.backgroundColor = UIColor.green
        case 2:
            result = "Ответ: Нет"
            self.view.backgroundColor = UIColor.red
        case 3:
            result = "Ответ: Возможно"
            self.view.backgroundColor = UIColor.yellow
        case 4:
            result = "Ответ: Может быть"
            self.view.backgroundColor = UIColor.yellow
        case 5:
            result = "Ответ: Скорее всего"
            self.view.backgroundColor = UIColor.yellow
        default:
            result = "Ответ: Вероятность есть"
            self.view.backgroundColor = UIColor.yellow
        }
        
        label.text = result
        button.isHidden = true
        
        clearTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(clearText), userInfo: nil, repeats: false)
    }

    @objc func clearText() {
        clearTimer.invalidate()
        
        label.text = "Загадайте вопрос и нажмите ОК"
        button.setTitle("ОК", for: .normal)
        button.isHidden = false
        
        self.view.backgroundColor = UIColor.systemBackground
    }
}
