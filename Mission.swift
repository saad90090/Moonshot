//
//  Mission.swift
//  Moonshot
//
//  Created by Saad Ahmad on 01/10/2026.
//

import Foundation


struct Mission : Codable,Identifiable {
    struct CrewRole : Codable {
        let name: String
        let role : String
    }
    
    let id: Int
    let launchDate : Date?
    let crew : [CrewRole]
    let description : String
    var display : String {
        "Apollo \(id)"
    }
    var image : String {
        "apollo\(id)"
    }
    var formattedLaunchDate: String{
        launchDate?.formatted(date:.abbreviated,time: .omitted) ?? "N/A"
    }
   
}
