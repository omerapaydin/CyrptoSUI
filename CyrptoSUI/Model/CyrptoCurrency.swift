//
//  CyrptoCurrency.swift
//  CyrptoSUI
//
//  Created by Ömer on 25.12.2024.
//

import Foundation


struct CyrptoCurrency: Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
    
}
