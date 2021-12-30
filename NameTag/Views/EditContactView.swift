//
//  EditContactView.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-28.
//

import SwiftUI

struct EditContactView: View {
    @EnvironmentObject var contactsVM: Contacts
    @Environment(\.dismiss) var dismiss
    
    var selectedContact: Contact
    
    @State var image: UIImage?
    @State var name: String
    @State var location: Location?
    
    var body: some View {
        VStack{
            DetailViewComponent(image: $image, name: $name, location: $location)
            
            Spacer()
            
            Button {
                contactsVM.removeContact(selectedContact)
                dismiss()
            } label: {
                Text("Delete")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    try? contactsVM.updateContact(selectedContact, name: name, location: location)
                    dismiss()
                } label: {
                    Text("Update")
                }
            }
        }
    }
    
    init(contact: Contact) {
        self.selectedContact = contact
        
        _image = State(initialValue: contact.image)
        _name = State(initialValue: contact.name)
        _location = State(initialValue: contact.location)
        
    }
}

struct EditContactView_Previews: PreviewProvider {
    static let contact = Contacts.example
    
    static var previews: some View {
        EditContactView(contact: contact)
    }
}
