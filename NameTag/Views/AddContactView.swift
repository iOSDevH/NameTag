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
    
    @State private var selectedImage: UIImage?
    
    @State private var name = ""
    
    var body: some View {
        VStack {
            contactsVM.image?
                .resizable()
                .scaledToFit()
            
            TextField("Name", text: $name)
        }
        .toolbar {
            Button {
                try? contactsVM.addContact(name: name, image: selectedImage!)
                dismiss()
            } label: {
                Text("Save")
            }
        }
        .onAppear {
            contactsVM.showImagePicker = true
        }
        .sheet(isPresented: $contactsVM.showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
        .onChange(of: selectedImage, perform: { _ in contactsVM.loadImage(selectedImage: selectedImage)})
    }
}

struct AddContactView_Previews: PreviewProvider {
    static let contact = Contacts.example
    
    static var previews: some View {
        AddContactView()
            .environmentObject(Contacts())
    }
}
