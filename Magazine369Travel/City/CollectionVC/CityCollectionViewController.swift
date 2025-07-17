//
//  CityCollectionViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/17/25.
//

import UIKit
import Kingfisher

class CityCollectionViewController: UIViewController {

    @IBOutlet var cityCollectionView: UICollectionView!
    
    @IBOutlet var segementControl: UISegmentedControl!
    
    @IBOutlet var searchBar: UISearchBar!
    
    enum Region: Int {
        case all
        case domestic
        case international
    }
    
    var city = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        
        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
        searchBar.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        
        // 너비
        let deviceWidth = UIScreen.main.bounds.width
        
        // 너비
        let cellWidth = deviceWidth - (16 * 2) - (16 * 1)
        
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellWidth / 1.4)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        // 셀 사이 간격
        layout.minimumInteritemSpacing = 10
        //
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .vertical
        
        cityCollectionView.collectionViewLayout = layout
    }
    
    @IBAction func segmentControllValueChanged(_ sender: UISegmentedControl) {
        let region = Region(rawValue: sender.selectedSegmentIndex) ?? .all
        
        let cityData = CityInfo().city
        var filter: [City] = []
        
        switch region {
        case .all:
            filter = cityData
            dump(region.rawValue)
            
        case .domestic:
            for item in cityData {
                if item.domestic_travel {
                    filter.append(item)
                }
            }
            dump(region.rawValue)
            
        case .international:
            for item in cityData {
                if !item.domestic_travel {
                    filter.append(item)
                }
            }
            dump(region.rawValue)
        }
        // 전체 데이터 공간에 필터된 데이터 담기 -> 데이터가 달라짐
        city = filter
        // 전체 데이터 담으면 다시 그려달라고 요청하기
        cityCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension CityCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        let item = city[indexPath.item]
        
        cell.cityNameLabel.text = "\(item.city_name) | \(item.city_english_name)"
        cell.cityExplainLabel.text = item.city_explain
        
        cell.configure(city: item)
        
        return cell
    }
    
    
}


// MARK: - UICollectionViewDelegate
extension CityCollectionViewController: UICollectionViewDelegate {
    // TODO: - 컬렉션 뷰 연습
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}


// MARK: - UISearchBarDelegate
extension CityCollectionViewController: UISearchBarDelegate {
    // 입력 할때마다 실행 됨
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let cityData = CityInfo().city
        var filter: [City] = []
        
        let region = Region(rawValue: segementControl.selectedSegmentIndex) ?? .all
        switch region {
        case .all:
            filter = cityData
        case .domestic:
            filter = cityData.filter {$0.domestic_travel}
        case .international:// false ??
            filter = cityData.filter {!$0.domestic_travel}
        }
        
        // 입력 내용이 존재하면 region Enum의 결과에서 필터링된 리스트를 통해 검색하기
        if !searchText.isEmpty {
            filter = filter.filter {$0.city_name.lowercased().contains(searchText)}
        }
        
//        if searchText.isEmpty {
//            filter = cityData
//        } else {
//            filter = cityData.filter {$0.city_name.lowercased().contains(searchText.lowercased())} 
//        }
//        
        city = filter
        cityCollectionView.reloadData()
    }
}
