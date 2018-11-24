//
//  ViewControllerForTable.swift
//  IButlet
//
//  Created by Jessie on 2018/11/20.
//  Copyright © 2018年 Jessie. All rights reserved.
//

import UIKit

class ViewControllerForTable: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    var location = ["Vancouver","Burnaby","Richmond","Maple Ridge","Langley","Surrey","Coquitlam","New Westminister","North Vancouver","West Vancouver","Delta", "White Rock", "Port Moody", "Port Cpquitlam"]
    var checked = [Bool]()
    var savedLocation : [String] = []
    var cites = ""
    
    @IBAction func next(_ sender: Any) {

        cites = savedLocation.joined(separator: ",")
        print(cites)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = Profile(context: context)
        entity.service_city = cites
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"banana",for :  indexPath)
        cell.textLabel?.text = location[indexPath.row]
        
        if checked[indexPath.row] == false{
            cell.accessoryType = .none
        } else if checked[indexPath.row] {
            cell.accessoryType = .checkmark
            
        }
        
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        checked = Array(repeating: false, count: location.count)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                checked[indexPath.row] = false
                savedLocation.removeAll(where : {$0 == location[indexPath.row]})
                print(savedLocation)
            } else {
                cell.accessoryType = .checkmark
                checked[indexPath.row] = true
                savedLocation.append(location[indexPath.row])
                print(savedLocation)
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
