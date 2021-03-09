//
//  AddContactViewController.swift
//  ContactsApp
//
//  Created by Sujit Molleti on 3/7/21.
//

import UIKit

class AddContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var addContactDelegate: ContactDelegate?
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func validateEntries() -> Bool{
        
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            addressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return false
        }
        
        return true
    }
 
//MARK: ImagePicker Methods
    @IBAction func didTapProfilePicImageView(_ sender: Any) {
        
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Unable to load image!!!")
        }
        
        profileImageView.image = image
        
    }
    
//MARK: Did Tap Contact Button
    @IBAction func didTapAddContactButton(_ sender: Any) {
        
        if( !validateEntries() ){
            return
        }
        
        let name: String = (nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let phone: String = (phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let address: String = (addressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        
        let image = profileImageView.image!
        
        let newContact = Contact(name: name, image: image, phone: phone, address: address)
        
        addContactDelegate!.addNewContact(contact: newContact)
        
        self.dismiss(animated: true, completion: nil)
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
