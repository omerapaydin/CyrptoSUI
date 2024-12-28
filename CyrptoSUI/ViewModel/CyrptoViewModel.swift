//
//  CyrptoViewModel.swift
//  CyrptoSUI
//
//  Created by Ömer on 26.12.2024.
//

import Foundation


class CryptoListViewModel: ObservableObject {

    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = Webservice()
    
    func downloadCrypto(url: URL) {
        
        webservice.downloadData(url: url) { result in
            
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cryptos):
               if let cryptos = cryptos {
                   DispatchQueue.main.async {
                       self.cryptoList = cryptos.map(CryptoViewModel.init)
                   }
                }
            }
            
            
            
        }
        
        
    }
    
    
}


struct CryptoViewModel {
    let crypto: CyrptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
    
    
}
