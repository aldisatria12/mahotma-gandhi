//
//  Tutorial.swift
//  MahotmaGandhi
//
//  Created by Calvin Chandra on 08/09/22.
//

import Foundation

enum Orientation {
    case up
    case down
    case left
    case right
    
    var imageType : String {
        switch self {
        case .up :
            return "up"
        case .down:
            return "down"
        case .left:
            return "left"
        case .right:
            return "right"
        }
    }
    
    var vertical : Bool {
        switch self {
        case .up :
            return true
        case .down:
            return true
        case .left:
            return false
        case .right:
            return false
        }
    }
}
