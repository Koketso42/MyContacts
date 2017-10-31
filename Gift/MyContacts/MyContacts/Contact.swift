//
//  Contact.swift
//  MyContacts
//
//  Created by Koketso Gift Matlhatsi on 10/31/17.
//  Copyright © 2017 Koketso Gift Matlhatsi. All rights reserved.
//


import UIKit
import AddressBook
import Contacts

class ContactEntry: NSObject {
    var fullName: String!
    var email: String?
    var phone: String?
    var image: UIImage?
    
    init(fullName: String, email: String?, phone: String?, image: UIImage?) {
        self.fullName = fullName
        self.email = email
        self.phone = phone
        self.image = image
    }
    
    init?(addressBookEntry: ABRecord) {
        super.init()
        
        // get AddressBook references (old-style)
        guard let fullNameRef = ABRecordCopyCompositeName(addressBookEntry)?.takeRetainedValue() else { return nil }
        
        // fullName
        self.fullName = fullNameRef as String
        
        // emails
        if let emailsMultivalueRef = ABRecordCopyValue(addressBookEntry, kABPersonEmailProperty)?.takeRetainedValue(), let emailsRef = ABMultiValueCopyArrayOfAllValues(emailsMultivalueRef)?.takeRetainedValue() {
            let emailsArray = emailsRef as NSArray
            for possibleEmail in emailsArray {
                if let properEmail = possibleEmail as? String {
                    self.email = properEmail
                    break
                }
            }
        }
        
        
        // image
        var image: UIImage?
        if ABPersonHasImageData(addressBookEntry) {
            image = UIImage(data: ABPersonCopyImageData(addressBookEntry).takeRetainedValue() as Data)
        }
        self.image = image ?? UIImage(named: "defaultUser")
        
        // phone
        if let phonesMultivalueRef = ABRecordCopyValue(addressBookEntry, kABPersonPhoneProperty)?.takeRetainedValue(), let phonesRef = ABMultiValueCopyArrayOfAllValues(phonesMultivalueRef)?.takeRetainedValue() {
            let phonesArray = phonesRef as NSArray
            if phonesArray.count > 0 { self.phone = phonesArray[0] as? String }
        }
        
    }
    
    @available(iOS 9.0, *)
    init?(cnContact: CNContact) {
        // fullName
        if !cnContact.isKeyAvailable(CNContactGivenNameKey) && !cnContact.isKeyAvailable(CNContactFamilyNameKey) { return nil }
        self.fullName = (cnContact.givenName + " " + cnContact.familyName).trimmingCharacters(in: CharacterSet.whitespaces)
        // image
        self.image = (cnContact.isKeyAvailable(CNContactImageDataKey) && cnContact.imageDataAvailable) ? UIImage(data: cnContact.imageData!) : nil
        // email
        if cnContact.isKeyAvailable(CNContactEmailAddressesKey) {
            for possibleEmail in cnContact.emailAddresses {
                self.email = possibleEmail.value as String
                break
            }
        }
        // phone
        if cnContact.isKeyAvailable(CNContactPhoneNumbersKey) {
            if cnContact.phoneNumbers.count > 0 {
                let phone = cnContact.phoneNumbers.first?.value
                self.phone = phone?.stringValue
            }
        }
    }
}

