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
    
    let city = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        
        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
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
}

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

extension CityCollectionViewController: UICollectionViewDelegate {
    
}
