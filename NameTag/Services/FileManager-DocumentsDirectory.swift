//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Heath Fashina on 2021-12-17.
//

import UIKit

let fileName = "NameTagDatabase.json"

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func documentExists(named docName: String) -> Bool {
        fileExists(atPath: Self.documentsDirectory.appendingPathComponent(docName).path)
    }
    
    func saveDocument(_ contents: String) throws {
        let url = Self.documentsDirectory.appendingPathComponent(fileName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            throw NameTagError.saveError
        }
        
    }
    
    func readDocument() throws -> Data {
        let url = Self.documentsDirectory.appendingPathComponent(fileName)
        do {
            return try Data(contentsOf: url)
        } catch {
            throw NameTagError.readError
        }
    }
    
    func saveImage(_ id: String, image: UIImage) throws {
        if let data = image.jpegData(compressionQuality: 0.6) {
            let imageURL = FileManager.documentsDirectory.appendingPathComponent("\(id).jpg")
            do {
                try data.write(to: imageURL)
            } catch {
                throw NameTagError.saveImageError
            }
        } else {
            throw NameTagError.saveImageError
        }
    }
    
    func deleteImage(_ id: String) throws {
        let imageURL = FileManager.documentsDirectory.appendingPathComponent("\(id).jpg")
        try? FileManager().removeItem(atPath: imageURL.path)
    }
    
    func readImage(with id: UUID) throws -> UIImage {
        let imageURL = FileManager.documentsDirectory.appendingPathComponent("\(id).jpg")
        do {
            let imageData = try Data(contentsOf: imageURL)
            if let image = UIImage(data: imageData) {
                return image
            } else {
                throw NameTagError.readImageError
            }
        } catch {
            throw NameTagError.readImageError
        }
    }
}
