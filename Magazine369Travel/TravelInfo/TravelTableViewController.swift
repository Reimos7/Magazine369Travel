//
//  TravelTableViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/12/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    var travelInfo = TravelInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "도시 상세 정보"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travelInfoCell = travelInfo.travel[indexPath.row]
        
        // 광고 셀 유무에 따라
        
        // 광고 셀
        if let ad = travelInfoCell.ad, ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "travelAdCell", for: indexPath) as! TravelAdTableViewCell
            
            // indexPath.row 보내주기
            cell.configure(title: travelInfoCell.title, indexPath: indexPath.row)
            
            return cell
        }
        
        // 광고셀이 아닌 여행 셀
        let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
        cell.configure(travelInfoCell: travelInfoCell, indexPath: indexPath.row, title: travelInfoCell.title)
        // 버튼 클릭 이벤트
        cell.likeButton.addTarget(self, action: #selector(tappedLikeButton), for: .touchUpInside)
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 광고 셀이면 높이 100
        if let travelInfoCellAd = travelInfo.travel[indexPath.row].ad, travelInfoCellAd {
            return 100
        }
        // 일반 셀이면 200
        return 200
    }
    
    // 좋아요 버튼 상태 변경
    @objc func tappedLikeButton(_ sender: UIButton) {
        //print("변경 전:", travelInfo.travel[sender.tag].like)
        var travelInfoTag = travelInfo.travel[sender.tag]
        travelInfoTag.like?.toggle()
        travelInfo.travel[sender.tag] = travelInfoTag
        //print("변경 후:", travelInfo.travel[sender.tag].like)
        tableView.reloadData()
    }
}
