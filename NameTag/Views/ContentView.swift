//
//  ContentView.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-27.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var contactsVM: Contacts
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationView {
            List(contactsVM.items, id: \.id) { contact in
                NavigationLink {
                    Text(contact.name)
                } label: {
                    HStack {
                        Image(uiImage: contact.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        
                        Text(contact.name)
                    }
                }
            }
            .navigationTitle("Name Tag")
            .toolbar {
                NavigationLink {
                    AddContactView()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .task {
                if FileManager().documentExists(named: fileName) {
                    try? contactsVM.loadImagesJSONFile()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
