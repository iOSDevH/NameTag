//
//  DetailViewComponent.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-29.
//

import SwiftUI

struct DetailViewComponent: View {
    @Binding var selectedImage: UIImage?
    @Binding var name: String
    
    var body: some View {
        VStack {
            Image(uiImage: selectedImage ?? UIImage())
                .resizable()
                .scaledToFit()
            
            TextField("Name", text: $name)
        }
    }
}

struct DetailViewComponent_Previews: PreviewProvider {
    static let contact = Contacts.example
    
    static var previews: some View {
        DetailViewComponent(selectedImage: .constant(contact.image), name: .constant(contact.name))
    }
}
