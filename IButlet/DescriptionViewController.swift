//
//  DescriptionViewController.swift
//  IButlet
//
//  Created by Jessie on 2018/11/20.
//  Copyright © 2018年 Jessie. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var Description: UITextView!
    
    @IBOutlet weak var comName: UITextField!
    
    @IBOutlet weak var comAddress: UITextField!
    @IBOutlet weak var comWeb: UITextField!
    var clickedTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Description.layer.borderWidth = 1
        
            comName.delegate = self
                comAddress.delegate = self
                comWeb.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        clickedTextField = textField
        
        
    }
    
    @objc func keyboardWillShow(sender: NSNotification,_ textField : UITextField) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if clickedTextField.frame.origin.y > keyboardSize.origin.y {
                self.view.frame.origin.y = keyboardSize.origin.y - clickedTextField.center.y - 40
            }
        }
        
        
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
        clickedTextField.resignFirstResponder()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
        override func touchesBegan(_ touches: Set<UITouch>,
                                   with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    
    
    // Do any additional setup after loading the view.
//        comName.delegate = self
//        comAddress.delegate = self
//        comWeb.delegate = self
//        Description.delegate = self
//
////        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChang(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
////        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChang(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
////        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChang(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
////
//
//
//    }
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//
//    }
//    override func touchesBegan(_ touches: Set<UITouch>,
//                               with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
//
////    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
////        if(text == "\n") {
////            textView.resignFirstResponder()
////            view.frame.origin.y = 0
////            return false
////        }
////        return true
////
////
////    }
////
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//
//           // textView.resignFirstResponder()
//        Description.resignFirstResponder()
//        view.frame.origin.y = 0
//        return true
//
//    }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        <#code#>
//    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChang(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChang(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChang(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        comName.resignFirstResponder()
//        comWeb.resignFirstResponder()
//        comAddress.resignFirstResponder()
//        return true
//    }
//
//
//    @objc func keyboardChang(notification : Notification){
//        print("haha")
//
//        if notification.name == UIResponder.keyboardWillShowNotification{
//            let keyboardFrame: NSValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)!
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyboardHeight = keyboardRectangle.height
//            view.frame.origin.y = -keyboardHeight
//        }else{
//            view.frame.origin.y = 0
//        }
//
//
//
//
//
//    }
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

    
}
