//
//  CryptoViewModel.swift
//  CryptoCrazyMVVM
//
//  Created by Burak Karagül on 2.04.2022.
//

import Foundation



struct CryproListViewModel{
    
    let cryptoCurrencyList : [CryptoCurrency]
    

    
    func numberOfRowsInSection() -> Int {
        
        return self.cryptoCurrencyList.count
        
    }
    

    
    func cryptoAtIndex(index : Int) -> CryptoViewModel{
        
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
        
    }
    
}

struct CryptoViewModel{
    
    let cryptoCurrency : CryptoCurrency
    
    var currency : String{
        return self.cryptoCurrency.currency
    }
    
    var price : Double{
        
         let priceRounded = Double(self.cryptoCurrency.price)
        return round(priceRounded!)
        
        
        }
    var name : String{
        return self.cryptoCurrency.name
    }
    
    var logo : String{
        
        return self.cryptoCurrency.logo_url
        
    }
        
        
    }
    

    


