//
//  nationalCurrency.swift
//  CurrencyForFutureMVC
//
//  Created by Маргарита Черняева on 11/5/20.
//

import Foundation
    
struct Currency : Codable {
    let date : String?
    let cur_Abbreviation : String?
    let cur_OfficialRate : Double?
    let cur_Symbol: String?
    
    enum CodingKeys: String, CodingKey {
        case cur_OfficialRate = "Cur_OfficialRate"
        case date = "Date"
        case cur_Abbreviation = "Cur_Abbreviation"
        case cur_Symbol = "Cur_Symbol"
    }
}



