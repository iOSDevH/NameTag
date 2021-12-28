//
//  NameTagError.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-27.
//

import Foundation

enum NameTagError: Error, LocalizedError {
    case saveError
    case readError
    case decodingError
    case encodingError
    case saveImageError
    case readImageError
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return NSLocalizedString("Could not load your data. Please try again.", comment: "")
        case .readError:
            return NSLocalizedString("Could not load your database, please reinstall the app.", comment: "")
        case .decodingError:
            return NSLocalizedString("Could not load your data. Please try again.", comment: "")
        case .encodingError:
            return NSLocalizedString("Could not save your data, please reinstall the app.", comment: "")
        case .saveImageError:
            return NSLocalizedString("Could not save image, please reinstall the app.", comment: "")
        case .readImageError:
            return NSLocalizedString("Could not load image, please reinstall the app.", comment: "")
        
        }
    }
}
