//
//  CurrencyModel.swift
//  CurrencyForFutureMVC
//
//  Created by Маргарита Черняева on 11/6/20.
//

import Foundation

class CurrencyModel {
    static func getData(closure: @escaping ([Currency]) -> Void) {
        
        DispatchQueue.global(qos: .userInitiated).async { // для тяжелых задач
            let urlJason = URL(string: "https://www.nbrb.by/api/exrates/rates?periodicity=0")
            let jsonData = try? Data(contentsOf: urlJason!)
            let currencyArray = try! JSONDecoder().decode([Currency].self, from: jsonData!)
            let filteredCurrencyArray = currencyArray.filter({$0.cur_Abbreviation == "USD" || $0.cur_Abbreviation == "EUR" || $0.cur_Abbreviation == "GBP"})
            print(filteredCurrencyArray)
                
            DispatchQueue.main.async {
                closure(filteredCurrencyArray)
            }
        }
    }
}
