//
//  CurrencyModel.swift
//  CurrencyForFutureMVC
//
//  Created by Маргарита Черняева on 11/6/20.
//

import Foundation

enum CurrencyModelError: Error {
    case urlError 
    case jsonDataError
    case jsonDecodeError
}

class CurrencyModel {
    static func getData(complition: @escaping ([Currency]) -> Void, error: @escaping (Error) -> Void) {

        DispatchQueue.global(qos: .userInitiated).async { // для тяжелых задач
            guard let urlJson = URL(string: "https://www.nbrb.by/api/exrates/rates?periodicity=0") else {
                DispatchQueue.main.async {
                    error(CurrencyModelError.urlError)
                }
                return
            }
            guard let jsonData = try? Data(contentsOf: urlJson) else {
                DispatchQueue.main.async {
                    error(CurrencyModelError.jsonDataError)
                }
                return
            }
            guard let currencyArray = try? JSONDecoder().decode([Currency].self, from: jsonData) else {
                DispatchQueue.main.async {
                    error(CurrencyModelError.jsonDecodeError)
                }
                return
            }
            let filteredCurrencyArray = currencyArray.filter({$0.cur_Abbreviation == "USD" || $0.cur_Abbreviation == "EUR" || $0.cur_Abbreviation == "GBP"})
            print(filteredCurrencyArray)
                
            DispatchQueue.main.async {
                complition(filteredCurrencyArray)
            }
        }
    }
}
