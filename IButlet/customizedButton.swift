//
//  customizedButton.swift
//  IButlet
//
//  Created by Jessie on 2018/11/22.
//  Copyright © 2018年 Jessie. All rights reserved.
//

import UIKit

class customizedButton: UIButton {

    var isOn = false
    var language = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
            super.init(coder: aDecoder )
            initButton()
    }
    
    func  initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = #colorLiteral(red: 0.3213599147, green: 0.7085034358, blue: 1, alpha: 1)
        //layer.cornerRadius = frame.size.width/2
        setTitleColor(#colorLiteral(red: 0.3213599147, green: 0.7085034358, blue: 1, alpha: 1), for: .normal)
        addTarget(self, action: #selector(customizedButton.buttonPressed), for: .touchUpInside)
        
    }
    @objc func buttonPressed() {
        activeButton(bool: !isOn)
    }
    func activeButton(bool: Bool) {
        isOn = bool
        let color = bool ? #colorLiteral(red: 0.3213599147, green: 0.7085034358, blue: 1, alpha: 1) : .clear
//        let title = bool ? "Engl" : "Follow"
        let titleColor = bool ? .white : #colorLiteral(red: 0.3213599147, green: 0.7085034358, blue: 1, alpha: 1)
        
//        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
        if isOn == true{
            language = "english"
        }else{
            language = "Other "
        }
        print(language)

    }
    
}
