//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by Sujit Molleti on 3/7/21.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var contactInfo: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let name = contactInfo?.name {
            self.title = name
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
