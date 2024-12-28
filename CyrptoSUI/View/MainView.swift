//
//  MainView.swift
//  CyrptoSUI
//
//  Created by Ömer on 25.12.2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cyrptoListViewModel: CryptoListViewModel
    
    init () {
        self.cyrptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            List(cyrptoListViewModel.cryptoList,id: \.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Text(crypto.price)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }.navigationTitle(Text("Crypto Crazy"))
        }.onAppear{
            cyrptoListViewModel.downloadCrypto(url: URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
        
        
        
    }
}

#Preview {
    MainView()
}
