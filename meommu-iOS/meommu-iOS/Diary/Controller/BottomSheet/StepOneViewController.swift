//
//  StepOneViewController.swift
//  meommu-iOS
//
//  Created by 이예빈 on 2023/09/21.
//

import UIKit
import PanModal


class StepOneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PanModalPresentable {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerXib()
        
        steponeTableVlew.delegate = self
        steponeTableVlew.dataSource = self
        
        
    }
    
    // -----------------------------------------
    // 2단계 바텀 시트 생성하기

    var panScrollable: UIScrollView? {
        return nil
    }
    
    // 접혔을 때
    var shortFormHeight: PanModalHeight {
        return .contentHeight(522)
    }

    // 펼쳤을 때
    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(290)
    }

    var cornerRadius: CGFloat {
        return 20
    }

    var allowsTapToDismiss: Bool {
        return true
    }

    var allowsDragToDismiss: Bool {
        return true
    }

    // 최상단 스크롤 불가
    var anchorModalToLongForm: Bool {
        return true
    }
    
    // TableView 생성하기
    
    @IBOutlet var steponeTableVlew: UITableView!
    
    var detailData: [String] = ["산책에 관한 일상", "낮잠에 관한 일상", "놀이에 관한 일상", "간식에 관한 일상", "표현(기분)에 관한 일상"]
    var emojiData: [String] = ["🌿", "😴", "⚽", "🍫", "😖"]
    
    let cellName = "StepOneTableViewCell"
    let cellReuseIdentifire = "StepOneCell"
    
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        steponeTableVlew.register(nibName, forCellReuseIdentifier: cellReuseIdentifire)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return detailData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = steponeTableVlew.dequeueReusableCell(withIdentifier: cellReuseIdentifire, for: indexPath) as! StepOneTableViewCell
        cell.detailLabel.text = detailData[indexPath.section]
        cell.emojiLabel.text = emojiData[indexPath.section]
        
        // cell 선택 시 배경 컬러 없애기
        cell.selectionStyle = .none
        
        return cell
    }
    
    // cell 선택 시 배경색 변경
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! StepOneTableViewCell
        cell.contentView.backgroundColor = UIColor(named: "SelectedButton")
        cell.detailLabel.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! StepOneTableViewCell
        cell.contentView.backgroundColor = UIColor(named: "BottomSheetTableView")
        cell.detailLabel.textColor = UIColor(named: "BottomSheetFont")
    }
    
    
}
