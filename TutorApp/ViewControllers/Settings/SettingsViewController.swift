//
//  SettingsViewController.swift
//  TutorApp
//
//  Created by Valeriy on 22.10.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//

import UIKit
import Firebase
import RSKImageCropper

class SettingsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, RSKImageCropViewControllerDelegate {
    func imageCropViewControllerDidCancelCrop(_ controller: RSKImageCropViewController) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func imageCropViewController(_ controller: RSKImageCropViewController, didCropImage croppedImage: UIImage, usingCropRect cropRect: CGRect, rotationAngle: CGFloat) {
        self.profileImage.image = croppedImage
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    let currentUser = Auth.auth().currentUser

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var newEmailField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    var didImageChange = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveSettings(_ sender: Any) {
        
        if let newName = nameField.text {
            if newName != currentUser?.displayName {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = newName
                changeRequest?.commitChanges { (error) in
                    // ...
                }
            }
        }
        
        if let newEmail = newEmailField.text {
            if newEmail != currentUser?.email {
                Auth.auth().currentUser?.updateEmail(to: newEmail) { (error) in
                    // ...
                }
            }


        }
        
        
        if let newPassword = newPasswordField.text {
            Auth.auth().currentUser?.updatePassword(to: newPassword) { (error) in
              // ...
            }
        }
        
        if didImageChange {
            let storage = Storage.storage()
            let storageRef = storage.reference()
            
            let data = Data((profileImage.image?.pngData()!)!)

            let imagesRef = storageRef.child("images/\(currentUser!.uid).png")

            let uploadTask = imagesRef.putData(data, metadata: nil) { (metadata, error) in
              guard let metadata = metadata else {
                // Uh-oh, an error occurred!
                return
              }
              // Metadata contains file metadata such as size, content-type.
              let size = metadata.size
              // You can also access to download URL after upload.
              imagesRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                  // Uh-oh, an error occurred!
                  return
                }
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.photoURL = downloadURL
                changeRequest?.commitChanges { (error) in
                  // ...
                }
                
                print(downloadURL)
              }
            }
        }
        
    }
    @IBAction func changePicture(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        var image : UIImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
////        editProfilePictureImageView.image = image
//
//
//        picker.dismiss(animated: false, completion: { () -> Void in
//
//            var imageCropVC : RSKImageCropViewController!
//
//            imageCropVC = RSKImageCropViewController(image: image, cropMode: RSKImageCropMode.circle)
//
//            imageCropVC.delegate = self
//
//            self.navigationController?.pushViewController(imageCropVC, animated: true)
//
//        })
    
    

//        var newImage : UIImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
//
//
//        picker.dismiss(animated: false, completion: { () -> Void in
//
//            var imageCropVC : RSKImageCropViewController!
//
//            imageCropVC = RSKImageCropViewController(image: newImage, cropMode: RSKImageCropMode.circle)
//
//            self.navigationController?.pushViewController(imageCropVC, animated: true)
//
//        })


//        if let possibleImage = info[.editedImage] as? UIImage {
//            newImage = possibleImage
//        } else if let possibleImage = info[.originalImage] as? UIImage {
//            newImage = possibleImage
//        } else {
//            return
//        }

//        profileImage.image = image
//        didImageChange = true
//        print(image.size)
//    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {

        let image : UIImage = image
        picker.dismiss(animated: false, completion: { () -> Void in
            print("ДОПА")
            var imageCropVC : RSKImageCropViewController!
            imageCropVC = RSKImageCropViewController(image: image, cropMode: RSKImageCropMode.circle)
            imageCropVC.delegate = self
            self.navigationController?.present(imageCropVC, animated: true)
        })
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
