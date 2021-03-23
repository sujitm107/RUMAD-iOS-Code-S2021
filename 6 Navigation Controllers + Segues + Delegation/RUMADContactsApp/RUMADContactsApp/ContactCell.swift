//
//  ContactCell.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 3/9/21.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(contact: Contact){
        
        contactNameLabel.text = contact.name
        
        profileImageView.image = contact.image
        
    }

}
