//
//  Fonts.swift
//  LMCore
//
//  Created by Pushpendra Singh on 15/02/23.
//

import Foundation

/// Enum for type of fonts (regular, medium, bold etc)
enum FontType: Int {
    case regular
    case medium
    case bold
}

/// Fonts Data Model with font's type name
public class Fonts {
    /// regular font type
    var regular: String
    /// medium font type
    var medium: String
    /// bold font type
    var bold: String
    
    /// initialize method with font's type name params
    public init(regular: String, medium: String, bold: String) {
        self.regular = regular
        self.medium = medium
        self.bold = bold
    }
}
