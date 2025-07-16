//
//  TravelInfoRefactorViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/16/25.
//

import UIKit

class CityViewController: UIViewController {

    let city = CityInfo().city
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    @IBOutlet var tableView: UITableView!
    
    enum Region: Int {
        case all
        case domestic
        case international
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    func configureTableView() {
        
        navigationItem.title = "인기 도시"
        // 대리자 등록
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 200
        
        // xib 등록
        let xib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.identifier)
    }
    
    
    // MARK: - Region Enum 기준
    func filteredCity() -> [City] {
        
        let filteredCityList: [City]
        // 세그먼트 컨트롤 -> region enum으로 변경
        let region = Region(rawValue: segmentControl.selectedSegmentIndex)
        
        switch region {
        case .all:           // 모두
            filteredCityList = city
        case .domestic:      // 국내
            filteredCityList = city.filter {$0.domestic_travel == true}
        case .international: // 해외
            filteredCityList = city.filter {$0.domestic_travel == false}
        default:
            filteredCityList = city
    }
        
        guard let searchText = textField.text,
              !searchText.isEmpty else {return filteredCityList}
        
        //공백 입력 경우, whitespace 처리
        let trimmedText = searchText.trimmingCharacters(in: .whitespaces)
        
        // 모두, 국내, 해외에서 필터링 후 -> 이거에 맞는 검색
        let filterResult = filteredCityList.filter {
            $0.city_name.lowercased().contains(trimmedText) ||
            $0.city_english_name.lowercased().contains(trimmedText) ||
            $0.city_explain.lowercased().contains(trimmedText)
        }
        
        return filterResult
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let region = Region(rawValue: sender.selectedSegmentIndex) ?? .all
        
        switch region {
        case .all:
            print(region.rawValue)
        case .domestic:
            print(region.rawValue)
        case .international:
            print(region.rawValue)
        
        }
        tableView.reloadData()
    }
    
    
    @IBAction func EditinDidEnd(_ sender: UITextField) {
        print(#function)
        tableView.reloadData()
        
    }
    
    @IBAction func EditingChanged(_ sender: UITextField) {
        print(#function)
        tableView.reloadData()
        
    }
    
}

// MARK: - UITableViewDataSource
extension CityViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCity().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
        
        let row = filteredCity()[indexPath.row]
        cell.configure(city: row)
        
        
        return cell 
    }
    
    
    
}


// MARK: - UITableViewDelegate
extension CityViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "CityDetailViewController") as! CityDetailViewController
        
        let row = city[indexPath.row]
        
        vc.image = row.city_image
        vc.name = row.city_name
        vc.explain = row.city_explain
        
        vc.modalPresentationStyle = .overFullScreen
        
       present(vc, animated: true)
        
    }
    
}
