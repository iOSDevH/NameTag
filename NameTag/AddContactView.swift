//
//  AddContactView.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-27.
//

import SwiftUI

struct AddContactView: View {
    @EnvironmentObject var contactsVM: Contacts
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedImage: UIImage?
    @State private var name = ""
    
    var body: some View {
        VStack {
            Image(uiImage: (selectedImage ?? UIImage(systemName: "photo")!))
                .resizable()
                .scaledToFit()
            
            TextField("Name", text: $name)
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static let contact = Contacts.example
    
    static var previews: some View {
        AddContactView(selectedImage: .constant(contact.image) )
            .environmentObject(Contacts())
    }
}
