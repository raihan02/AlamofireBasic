//
//  ViewController.swift
//  AlamoFireBasic
//
//  Created by Twnibit_Raihan on 20/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import UIKit
var tempCopyCountryArray = [Country]()
var storedCountryArray = [Country]()
class ViewController: UIViewController {
    
    
    @IBOutlet weak var countryTableView: CountryTableView!
    private var sections = [Section]() {
        didSet {
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let serviceObject = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        serviceObject.getAllCountryName(completion: { [weak self] in
            self?.countryTableView.reloadData()
        })
        
        
    }
}



