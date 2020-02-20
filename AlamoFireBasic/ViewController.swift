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
    
    
    @IBOutlet weak var countryTableView: UITableView!
    var user: String?

    private var sections = [Section]() {
        didSet {
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CountryTableViewCell", bundle: nil)
        countryTableView.register(nib, forCellReuseIdentifier: "CountryTableViewCell")
        
       let headerNib = UINib(nibName: "Header", bundle: Bundle.main)
        countryTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "header")
        countryTableView.dataSource = self
        countryTableView.delegate = self
        countryTableView.rowHeight = UITableView.automaticDimension
        countryTableView.separatorColor = UIColor.clear
   
        let serviceObject = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        serviceObject.getAllCountryName(completion: { [weak self] in
            self?.countryTableView.reloadData()
        })
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
            self.sections = Section.alphabaticallySectionedCountry()
        }
        fun()
        
    }
    func fun()
    {
        print("Hello section: ", sections)
    }
    
}



extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].country.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return sections.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
//
//        cell.countryNameLabel.text = "Name : "
//        cell.countryNameLabel.text! += tempCopyCountryArray[indexPath.row].name!
//        cell.countryCapitalLabel.text = "Capital : "
//        cell.countryCapitalLabel.text! += tempCopyCountryArray[indexPath.row].capital!
//        cell.countryCodeLabel.text = "Country Code : "
//        cell.countryCodeLabel.text! += tempCopyCountryArray[indexPath.row].countryCode!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        let coun = sections[indexPath.section].country[indexPath.row]
        cell.countryNameLabel.text = "Name : "
        cell.countryNameLabel.text = coun.name
        cell.countryCapitalLabel.text = "Capital : "
        cell.countryCapitalLabel.text = coun.capital
        cell.countryCodeLabel.text = "Country Code : "
        cell.countryCodeLabel.text = coun.countryCode
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sections)
    }
    /*
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
          let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! Header
        
        for i in 0 ..< sections.count - 1{
            
            print(sections[i].name)
        }
        view.titlLabel.text = sections[section].name
        return view
    
        
    }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let backgroundView = UIView(frame: CGRect.zero)
        let label = UILabel()
        label.frame = CGRect(x: 200, y: 0, width: 300, height: 30)
        label.text = sections[section].name
        backgroundView.addSubview(label)
        backgroundView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return backgroundView
    }
}
