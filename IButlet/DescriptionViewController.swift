//
//  DescriptionViewController.swift
//  IButlet
//
//  Created by Jessie on 2018/11/20.
//  Copyright © 2018年 Jessie. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var Description: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Description.layer.borderWidth = 1
        // Do any additional setup after loading the view.
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
