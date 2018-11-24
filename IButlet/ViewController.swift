//
//  ViewController.swift
//  IButlet
//
//  Created by Jessie on 2018/11/18.
//  Copyright © 2018年 Jessie. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    
    var imagePicker = UIImagePickerController()
    var imageName : String = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func addressButton(_ sender: Any) {
        
    }
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBAction func addPhote(_ sender: Any) {
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        profileImage.image = selectedImage

        let fileMng = FileManager.default
        let imgURL = fileMng.urls(for : .documentDirectory, in: .userDomainMask).first!
        let documentPath = imgURL.path
        imageName = randomString(length: 4)
        let imgPath = imgURL.appendingPathComponent("\(imageName).png")
        
        do {
            let files = try fileMng.contentsOfDirectory(atPath: "\(documentPath)")
            
            for file in files {
                if "\(documentPath)/\(file)" == imgPath.path {
                    try fileMng.removeItem(atPath: imgPath.path)
                }
            }
        } catch  {
            print("Could not add image from document directory: \(error)")
        }
        
        // Create imageData and write to filePath
        do {
            if let pngImageData = selectedImage.pngData() {
                try pngImageData.write(to: imgPath, options: .atomic)
            }
        } catch {
            print("couldn't write image")
        }

        //save file path in core data
        let entity = Profile(context: context)
        entity.profile_img = imgPath.path
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        getData()
        //test if we write into core data
        
        dismiss(animated: true, completion: nil)
    }
    
    func getData() {
        do{
            let img = try context.fetch(Profile.fetchRequest())
            print(img)
        }catch{
            print("fetch faild ")
        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width)!/2
        profileImage?.clipsToBounds = true
    }

    
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "Your camera is not found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }

}











@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
