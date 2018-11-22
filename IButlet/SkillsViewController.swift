//
//  SkillsViewController.swift
//  IButlet
//
//  Created by Jessie on 2018/11/20.
//  Copyright © 2018年 Jessie. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var checked = [Bool]()
    var savedSkills : [String] = []
    
    var skills = ["Plumbing & Heating Service","Electrival Service","House Maidi Sercive","Appliances,Repairs & Installations","Garden Works & Maintenance","Morning Service","Roofing","Leakage","Flooring"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "apple", for: indexPath)
        cell.textLabel?.text = skills[indexPath.row]
        if checked[indexPath.row] == false{
            cell.accessoryType = .none
        } else if checked[indexPath.row] {
            cell.accessoryType = .checkmark
            
        }
        
        return cell 
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        checked = Array(repeating: false, count: skills.count)
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                checked[indexPath.row] = false
                savedSkills.removeAll(where : {$0 == skills[indexPath.row]})
            } else {
                cell.accessoryType = .checkmark
                checked[indexPath.row] = true
                savedSkills.append(skills[indexPath.row])
                print(savedSkills)
            }
        }
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
