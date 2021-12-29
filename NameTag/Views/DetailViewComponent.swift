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
                .frame(maxHeight: 300)
            
            TextField("Name", text: $name)
                .padding(.horizontal)
        }
        .padding()
    }
}

struct DetailViewComponent_Previews: PreviewProvider {
    static let contact = Contacts.example
    
    static var previews: some View {
        DetailViewComponent(selectedImage: .constant(contact.image), name: .constant(contact.name))
    }
}
