//
//  CookCreateViewController.swift
//  TabbarCoredataAll
//
//  Created by Semih Özsoy on 13.05.2021.
//

import UIKit
import CoreData

class CookCreateViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cookNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePhoto))
        imageView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func choosePhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
       present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        //Coredata kaydetme işlemi yapılacak
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let newCook = NSEntityDescription.insertNewObject(forEntityName: "Cook", into: context)
        newCook.setValue(cookNameText.text, forKey: "name")
        let imageData = imageView.image?.jpegData(compressionQuality: 0.5)
        newCook.setValue(imageData, forKey: "image")
        
        do {
            try context.save()
        } catch  {
            print("can not be save")
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
