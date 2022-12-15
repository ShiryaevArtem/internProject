//
//  Model.swift
//  Intern project
//
//  Created by Artem on 14.12.2022.
//

import Foundation
import UIKit
struct Post:Codable,Identifiable{
    let id = UUID()
    var title: String
    var url: String
    var thumbnailUrl: String
}
