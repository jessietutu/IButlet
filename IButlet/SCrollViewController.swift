//
//  SCrollViewController.swift
//  IButlet
//
//  Created by Jessie on 2018/11/21.
//  Copyright © 2018年 Jessie. All rights reserved.
//

import UIKit
//import TLPhotoPicker


class SCrollViewController: UIViewController ,UIScrollViewDelegate, UIImagePickerControllerDelegate {
    

    

    @IBAction func chooseImage(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender as? UIView
            alert.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var scrollVIew: UIScrollView!
    @IBOutlet weak var pageCOntrol: UIPageControl!
    var imagePicker = UIImagePickerController()
    var scrollImage :[UIImage] = []
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0 )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageCOntrol.numberOfPages = scrollImage.count
        for i in 0..<scrollImage.count{
            frame.origin.x = scrollVIew.frame.width * CGFloat(i)
            frame.size = scrollVIew.frame.size
            let imgView = UIImageView(frame: frame)
            imgView.image = scrollImage[i]
            self.scrollVIew.addSubview(imgView)
            
        }
        
        scrollVIew.contentSize = CGSize(width: scrollVIew.frame.width * CGFloat(scrollImage.count),
                                        height: scrollVIew.frame.height)
        scrollVIew.delegate = self
//        self.view.bringSubviewToFront(pageCOntrol)
        
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNum = scrollVIew.contentOffset.x/scrollView.frame.width
        pageCOntrol.currentPage = Int(pageNum)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        scrollImage.append(selectedImage)
        dismiss(animated: true, completion: nil)
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

    
//    func selectedCameraCell(picker: TLPhotosPickerViewController) {
//        <#code#>
//    }
//
//    func deselectedPhoto(picker: TLPhotosPickerViewController, at: Int) {
//        <#code#>
//    }
//
//    func selectedPhoto(picker: TLPhotosPickerViewController, at: Int) {
//        <#code#>
//    }
//
//    func selectedAlbum(picker: TLPhotosPickerViewController, title: String, at: Int) {
//        <#code#>
//    }
    
    
}
