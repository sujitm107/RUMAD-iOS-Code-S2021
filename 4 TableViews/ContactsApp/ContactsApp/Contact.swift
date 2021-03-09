//
//  Contact.swift
//  ContactsApp
//
//  Created by Sujit Molleti on 3/7/21.
//

import UIKit

class Contact{
    
    //instance variables
    var name: String
    var image: UIImage
    var phone: String
    var address: String
    
    //Constructor
    init(name: String, image: UIImage, phone: String, address: String) {
        self.name = name
        self.image = image
        self.phone = phone
        self.address = address
    }
    
    
}
