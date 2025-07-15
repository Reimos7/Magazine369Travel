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
    
    @IBOutlet var textField: UITextField!
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
        
        let filteredCityList: [City]
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            //dump(cityInfo.city)
            filteredCityList =  cityInfo.city
        case 1: // 국내
            //dump(cityInfo.city.filter { $0.domestic_travel == true })
            filteredCityList =  cityInfo.city.filter { $0.domestic_travel == true }
        case 2: // 해외
            //dump(cityInfo.city.filter { $0.domestic_travel == false })
            filteredCityList = cityInfo.city.filter { $0.domestic_travel == false }
        default:
            filteredCityList =  cityInfo.city
        }
        
        guard let searchText = textField.text,
              !searchText.isEmpty else {return filteredCityList}
        
        
        // 모두, 국내, 해외에서 필터링 후 -> 이거에 맞는 검색
        let filterResult = filteredCityList.filter {
            $0.city_name.lowercased().contains(searchText) ||
            $0.city_english_name.lowercased().contains(searchText) ||
            $0.city_explain.lowercased().contains(searchText)
        }
        
        
        return filterResult
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
    
    
    @IBAction func edtingDidEnd(_ sender: UITextField) {
        tableView.reloadData()
    }
    @IBAction func edtingChanged(_ sender: UITextField) {
        tableView.reloadData()
    }
}
