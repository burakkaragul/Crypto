//
//  ViewController.swift
//  CryptoCrazyMVVM
//
//  Created by Burak Karagül on 1.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    private var cryptoListViewModel : CryproListViewModel!
    var selectedCrypto : CryptoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        getData()
        
    }
    
    func getData(){
        
                
                let url = URL(string: "https://api.nomics.com/v1/currencies/ticker?key=0dc168feec735e5fb3ce63cead785281d09fc0a0" )!
                
                WebService().downloadCurrencies(url: url) { cryptos in
                    
                    if let cryptos = cryptos{
                        
                        self.cryptoListViewModel = CryproListViewModel(cryptoCurrencyList: cryptos)
                        
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                    
                }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        
        cell.priceText.text = "\(cryptoViewModel.price)"
        cell.currencyText.text = cryptoViewModel.currency
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCrypto = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailVC{
            vc.choosenCrypto = selectedCrypto
            navigationController?.pushViewController(vc, animated: true)
                        
        }
        
    }
    

    

}

