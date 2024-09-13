//
//  Movie.swift
//
//
//  Created by Alperen Sarışan on 12.09.2024.
//

import Foundation
import Vapor

struct Movie: Content {
    let title: String
    let year: Int
}
