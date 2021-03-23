//
//  Contact.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 3/9/21.
//

import UIKit

class Contact{
    
    var name: String
    var image: UIImage
    var phone: String
    var address: String
    
    //public Contact(String name, String phone, String address)
    
    init(name: String, image: UIImage, phone: String, address: String) {
        self.name = name
        self.image = image
        self.phone = phone
        self.address = address
    }
    
    
}
