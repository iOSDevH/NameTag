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
    
    @State var selectedImage: UIImage?
    @State var name: String
    
    var body: some View {
        VStack{
            DetailViewComponent(selectedImage: .constant(selectedContact.image), name: $name)
            
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
                    //update contact
                    dismiss()
                } label: {
                    Text("Update")
                }
            }
        }
    }
}

struct EditContactView_Previews: PreviewProvider {
    static var previews: some View {
        EditContactView(selectedContact: Contacts.example, name: Contacts.example.name)
    }
}
