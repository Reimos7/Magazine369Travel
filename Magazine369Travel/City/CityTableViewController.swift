//
//  CityTableViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/15/25.
//

import UIKit
import Kingfisher

class CityTableViewController: UITableViewController {
    
    let cityInfo = CityInfo()
    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "인기 도시"
        
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)
        
        tableView.rowHeight = 200
    }
    
    
    // MARK: - 0 , 1 , 2 조건에 따라 
    func filteredCity() -> [City] {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            //dump(cityInfo.city)
            return cityInfo.city
        case 1: // 국내
            //dump(cityInfo.city.filter { $0.domestic_travel == true })
            return cityInfo.city.filter { $0.domestic_travel == true }
        case 2: // 해외
            //dump(cityInfo.city.filter { $0.domestic_travel == false })
            return cityInfo.city.filter { $0.domestic_travel == false }
        default:
            return cityInfo.city
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCity().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cityInfoCell = cityInfo.city[indexPath.row]
        let cityInfoCell = filteredCity()[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
        
        cell.configure(cityInfoCell: cityInfoCell)
        
        return cell
    }
    
    
    // MARK: - 세그먼트 컨트롤러 클릭 시 테이블뷰 reload
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("모두")
        case 1:
            print("국내")
        case 2:
            print("해외")
        default:
            print("에러")
        }
        tableView.reloadData()
    }
}
