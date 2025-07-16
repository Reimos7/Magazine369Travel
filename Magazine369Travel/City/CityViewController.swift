//
//  TravelInfoRefactorViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/16/25.
//

import UIKit

class CityViewController: UIViewController {

    let city = CityInfo().city
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    func configureTableView() {
        
        navigationItem.title = "인기도시"
        // 대리자 등록
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 200
        
        // xib 등록
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)
    }

}

// MARK: - UITableViewDataSource
extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
        
        let row = city[indexPath.row]
        cell.configure(city: row)
        
        
        return cell 
    }
    
    
    
}


// MARK: - UITableViewDelegate
extension CityViewController: UITableViewDelegate {
    
}
