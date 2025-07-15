//
//  TravelTableViewController.swift
//  Magazine369Travel
//
//  Created by Reimos on 7/12/25.
//

import UIKit
import Kingfisher
import Toast

class TravelTableViewController: UITableViewController {
    
    var travelInfo = TravelInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "도시 상세 정보"
        
        let adXib = UINib(nibName: TravelIdentifier.Identifier.ad, bundle: nil)
        tableView.register(adXib, forCellReuseIdentifier: TravelIdentifier.Identifier.ad)
        
        let travelXib = UINib(nibName: TravelIdentifier.Identifier.travel, bundle: nil)
        tableView.register(travelXib, forCellReuseIdentifier: TravelIdentifier.Identifier.travel)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfo.travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let travelInfoCell = travelInfo.travel[indexPath.row]
        
        // 광고 셀 유무에 따라
        
        // 광고 셀
        if let ad = travelInfoCell.ad, ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelIdentifier.Identifier.ad, for: indexPath) as! TravelAdXIBTableViewCell
            
            // indexPath.row 보내주기
            cell.configure(title: travelInfoCell.title, indexPath: indexPath.row)
            
            return cell
        }
        // 광고셀이 아닌 여행 셀
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelIdentifier.Identifier.travel, for: indexPath) as! TravelXIBTableViewCell
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
    
    // MARK: - 광고 셀 클릭시 toastMessage 하단에 보여주기
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let ad = travelInfo.travel[indexPath.row].ad, ad {
            // toast 메시지
            // duration 몇 초 동안 보여줄지
            // position 위치, top이나 center는 키보드 때매 올라가니까 그럴때 사용하긴 함
            // 뷰 기준으로 나오는거니까 다르게 사용하면 제대로 적용 안될 가능성이 큼
            self.navigationController?.view.makeToast("광고 셀입니다", duration: 2.0, position: .bottom)
        } else {
            pushFeature()
        }
        
        
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
    
    // MARK: - TravelViewController로 화면 이동 구현
    private func pushFeature() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TravelViewController") as! TravelViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
