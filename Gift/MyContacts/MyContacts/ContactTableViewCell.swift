//
//  ContactTableViewCell.swift
//  MyContacts
//
//  Created by Koketso Gift Matlhatsi on 10/31/17.
//  Copyright © 2017 Koketso Gift Matlhatsi. All rights reserved.
//

import AddressBook
import Contacts
import UIKit

class ContactTableViewCell: UITableViewCell {
    // outlets
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactEmailLabel: UILabel!
    @IBOutlet weak var contactPhoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCircularAvatar() {
        contactImageView.layer.cornerRadius = contactImageView.bounds.size.width / 2.0
        contactImageView.layer.masksToBounds = true
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setCircularAvatar()
    }
    
    func configureWithContactEntry(_contact: ContactEntry) {
        contactNameLabel.text = _contact.fullName
        contactEmailLabel.text = _contact.email ?? ""
        contactPhoneLabel.text = _contact.phone ?? ""
        contactImageView.image = _contact.image ?? UIImage(named: "defaultUser")
        setCircularAvatar()
    }
}

