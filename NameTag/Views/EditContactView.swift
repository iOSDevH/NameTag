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
    
    var body: some View {
        VStack{
            Image(uiImage: selectedContact.image)
                .resizable()
                .scaledToFit()
            Text(selectedContact.name)
            
            Spacer()
            
            Button {
                contactsVM.removeContact(selectedContact)
                dismiss()
            } label: {
                Text("Delete")
                    .foregroundColor(.red)
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    //update contact
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct EditContactView_Previews: PreviewProvider {
    static var previews: some View {
        EditContactView(selectedContact: Contacts.example)
    }
}
