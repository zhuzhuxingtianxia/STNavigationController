//
//  TabelViewController.swift
//  STNavigationController_Example
//
//  Created by ZZJ on 2022/7/20.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

class TabelViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "列表"
        // Do any additional setup after loading the view.
        
    }
    
    override func setupUI() {
        view.addSubview(tableView)
    }
    override func setupLayouts() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: view.bounds, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        table.separatorColor = UIColor.purple
        table.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        table.delegate = self
        table.dataSource = self
        if #available(iOS 15.0, *) {
            table.sectionHeaderTopPadding = 0
        }
        
        return table
    }()

}

extension TabelViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className)!
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
        
    }
    
    
}
