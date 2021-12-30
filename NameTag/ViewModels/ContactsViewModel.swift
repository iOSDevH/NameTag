//
//  Contacts.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-27.
//

import UIKit
import SwiftUI

class Contacts: ObservableObject {
    @Published var items: [Contact]
    
    @Published var showAddContact = false
    @Published var showImagePicker = false
    @Published var image: Image? = nil
    
    var sortedItems: [Contact] {
        items.sorted()
    }
    
    init() {
        print(FileManager.documentsDirectory.path)
        items = []
    }
    
    func loadImage(selectedImage: UIImage?) {
        guard let selectedImage = selectedImage else {
            return
        }

        image = Image(uiImage: selectedImage)
        
    }
    
    func addContact(name: String, image: UIImage, location: Location?) throws {
        let newContact = Contact(name: name, location: location)
        do {
            try FileManager().saveImage(newContact.id.uuidString, image: image)
            items.append(newContact)
            try saveContactsJSONFile()
            self.image = nil
        } catch {
            throw NameTagError.saveError
        }
    }
    
    func updateContact(_ contact: Contact, name: String, location: Location?) throws {
        if let index = items.firstIndex(of: contact) {
            items[index].name = name
            items[index].location = location
            do {
                try saveContactsJSONFile()
                self.image = nil
            } catch {
                throw NameTagError.saveError
            }
        }
    }
    
    func removeContact(_ contact: Contact) {
        if let index = items.firstIndex(of: contact) {
            try? FileManager().deleteImage(contact.id.uuidString)
            items.remove(at: index)
            try? saveContactsJSONFile()
        }
    }
    
    func removeContacts(at offset: IndexSet) {
        for i in offset {
            if let index = items.firstIndex(where: { $0 == sortedItems[i] }) {
                let contact = items[index]
                removeContact(contact)
            }
        }
    }
    
    func saveContactsJSONFile() throws {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(items)
            let jsonString = String(decoding: data, as: UTF8.self)
            do {
                try FileManager().saveDocument(jsonString)
            } catch {
                throw NameTagError.encodingError
            }
        } catch {
            throw NameTagError.encodingError
        }
    }
    
    func loadImagesJSONFile() throws {
        do {
            let data = try FileManager().readDocument()
            let decoder = JSONDecoder()
            do {
                items = try decoder.decode([Contact].self, from: data)
            } catch {
                throw NameTagError.decodingError
            }
        } catch {
            throw NameTagError.decodingError
        }
    }
    
    static let example = Contact(name: "Test", location: Location.example)
}
