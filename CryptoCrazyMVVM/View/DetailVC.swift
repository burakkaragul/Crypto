//
//  DetailVC.swift
//  CryptoCrazyMVVM
//
//  Created by Burak Karagül on 3.04.2022.
//

import UIKit
import SDWebImage



class DetailVC: UIViewController {
    
    var choosenCrypto : CryptoViewModel?
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
getData()
        
    }
    
    func getData(){
        
        if let crypto = choosenCrypto{
            
            imageView.sd_setImage(with: URL(string: crypto.logo))
            currencyLabel.text = crypto.currency
            nameLabel.text = crypto.name
            priceLabel.text = String(crypto.price)
                        
        }
        
        
    }
    

    
}
