//
//  AddContactViewController.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 3/9/21.
//

import UIKit

class AddContactViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var addContactDelegate: ContactDelegate?
    
    
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
    

    @IBAction func didTapAddContactButton(_ sender: Any) {
        
        if(!validateEntries()){
            return
        }
        
        let name = (nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let phone = (phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let address = (addressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let profileImage = profileImageView.image!
        
        let newContact = Contact(name: name, image: profileImage, phone: phone, address: address)
        
        addContactDelegate!.addNewContact(contact: newContact)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    

}
