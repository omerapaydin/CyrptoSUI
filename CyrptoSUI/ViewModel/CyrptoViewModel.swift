//
//  CyrptoViewModel.swift
//  CyrptoSUI
//
//  Created by Ömer on 26.12.2024.
//

import Foundation

@MainActor
class CryptoListViewModel: ObservableObject {

    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = Webservice()
    
    
    func downloadCryptoAsync(url: URL) async {
        do {
            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
        }catch {
            print(error)
        }
        
    }
    
    
    
    
    
    /*
    
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
    }*/
    
    
    
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
