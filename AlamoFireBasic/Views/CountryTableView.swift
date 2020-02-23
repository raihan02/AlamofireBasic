//
//  CountryTableView.swift
//  AlamoFireBasic
//
//  Created by Twnibit_Raihan on 23/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import UIKit

class CountryTableView: UITableView {
    
    private var sections = [Section]() {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    override func awakeFromNib() {
           super.awakeFromNib()
           self.delegate=self
           self.dataSource=self
           let nib = UINib(nibName: "CountryTableViewCell", bundle: nil)
           self.register(nib, forCellReuseIdentifier: "CountryTableViewCell")
           self.rowHeight = UITableView.automaticDimension
           self.separatorColor = UIColor.clear
           DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
              self.sections = Section.alphabaticallySectionedCountry()
          }
    
        }
}
    
    
    
extension CountryTableView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].country.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return sections.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        let coun = sections[indexPath.section].country[indexPath.row]
        cell.countryNameLabel.text = "Name : "
        cell.countryNameLabel.text! += coun.name!
        cell.countryCapitalLabel.text = "Capital : "
        cell.countryCapitalLabel.text! += coun.capital!
        cell.countryCodeLabel.text = "Country Code : "
        cell.countryCodeLabel.text! += coun.countryCode!
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
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
