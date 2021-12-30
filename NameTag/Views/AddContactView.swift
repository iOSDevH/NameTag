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
    @State private var location: Location? = nil
    
    var body: some View {
        VStack {
            DetailViewComponent(image: $selectedImage, name: $name, location: $location)
            
            Spacer()
        }
        .padding()
        .toolbar {
            Button {
                try? contactsVM.addContact(name: name, image: selectedImage!, location: location)
                dismiss()
            } label: {
                Text("Save")
            }
            .disabled(selectedImage == nil || name == "")
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
