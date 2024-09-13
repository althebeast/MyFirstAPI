//
//  File.swift
//  
//
//  Created by Alperen Sarışan on 12.09.2024.
//

import Foundation
import Vapor

struct MoviesQuery: Content {
    
    var sort: String
    var search: String?
}
