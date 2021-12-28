//
//  Contact.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-27.
//

import UIKit

struct Contact: Identifiable, Codable {
    var id = UUID()
    var name: String
    
    var image: UIImage {
        do {
            return try FileManager().readImage(with: id)
        } catch {
            return UIImage(systemName: "photo.fill")!
        }
    }
}
