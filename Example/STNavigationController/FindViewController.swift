//
//  FindViewController.swift
//  Test
//
//  Created by ZZJ on 2022/7/18.
//

import UIKit
import STNavigationController

class FindViewController: UIViewController {

    let array = [
        "自定义导航颜色",
        "设置透明导航",
        "导航返回设置",
        "Table列表",
        "",
        "",
        "",
        "",
        "",
        ""
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
        navigationController?.barTintStyle(.white)
        view.addSubview(tableView)
        
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - kNavigationH - (tabBarController?.tabBar.frame.height ?? 0) - 5), style: .plain)
        table.contentInsetAdjustmentBehavior = .never
        table.rowHeight = 120
        table.register(FindTableCell.self, forCellReuseIdentifier: FindTableCell.className)
        table.separatorStyle = .none
        table.sectionFooterHeight = 0.1
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.orange
        if #available(iOS 15.0, *) {
            table.sectionHeaderTopPadding = 0
        }
        table.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 1))
        return table
    }()

}

extension FindViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FindTableCell.className) as! FindTableCell
        cell.label.text = array[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = array[indexPath.row]
        if title.count > 0 {
            switch indexPath.row{
            case 0:
                let vc = CustomNavigationColorController()
                vc.title = title
                navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = TransparentNavigationController()
                vc.title = title
                navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = DetailViewController()
                vc.title = title
                navigationController?.pushViewController(vc, animated: true)
            case 3:
                navigationController?.pushViewController(TabelViewController(), animated: true)
            default:
                break
            }
        }
    }
    
    
}


class FindTableCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.randColor()
        
        contentView.addSubview(label)
        
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        label.frame = CGRect.init(x: 15, y: contentView.center.y, width: label.frame.width, height: label.frame.height)
    }
    
    lazy var label: UILabel = {
        label = UILabel()
        label.text = "描述信息"
        return label
    }()
    
}
