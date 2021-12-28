//
//  NameTagApp.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-27.
//

import SwiftUI

@main
struct NameTagApp: App {
    @StateObject private var contactsVM = Contacts()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contactsVM)
        }
    }
}
