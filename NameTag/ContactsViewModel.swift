//
//  Contacts.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-27.
//

import UIKit

class Contacts: ObservableObject {
    @Published var items: [Contact]
    
    @Published var showAddContact = false
    @Published var showImagePicker = false
    @Published var selectedImage: UIImage? = nil
    
    init() {
        items = []
        items.append(Self.example)
    }
    
    static let example = Contact(name: "Test")
}
