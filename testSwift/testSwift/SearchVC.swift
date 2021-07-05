//
//  SearchVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/21.
//

import UIKit

class SearchVC: UIViewController,UISearchBarDelegate,
                UITableViewDataSource,UITableViewDelegate {
    
    // 所有组件
    var ctrls:[String] = ["Label","Button1","Button2","Switch"]
    // 搜索匹配的结果，Table View使用这个数组作为datasource
    var ctrlsel:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.myTalbeView)
        
        // 起始加载全部内容
        self.ctrlsel = self.ctrls
        // 代理
        self.searchBar.delegate = self
        self.myTalbeView.delegate = self
        self.myTalbeView.dataSource = self
        // 注册
        self.myTalbeView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // 返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlsel.count
    }
     
    // 创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        // 为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "cell"
        // 同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                                 for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.ctrlsel[indexPath.row]
        return cell
    }
     
    // 搜索代理UISearchBarDelegate方法，每次改变搜索内容时都会调用
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 没有搜索内容时显示全部组件
        if searchText == "" {
            self.ctrlsel = self.ctrls
        }else{
            // 匹配用户输入内容的前缀(不区分大小写)
            self.ctrlsel = []
            for string in self.ctrls {
                if string.lowercased().hasPrefix(searchText.lowercased()) {
                    self.ctrlsel.append(string)
                }
            }
        }
        // refrech
        self.myTalbeView.reloadData()
    }
    
    //MARK:-lazy
    lazy var searchBar : UISearchBar = {
        let searchB = UISearchBar.init(frame: CGRect.getFrame(x: 0, y: TABBAR_HEIGHT, w: SWIDTH, h: 80))
//        searchB.showsCancelButton = true
        // 勾选后，会在搜索条下面出现一个分段控制器。
//        searchB.showsScopeBar = true
        // 勾选后，搜索框右边会显示一个书本的按钮，单击会发送特殊事件。
//        searchB.showsBookmarkButton = true
        // 勾选后，搜索框右边显示一个圆形向下的按钮，单击会发送特殊事件。
//        searchB.showsSearchResultsButton = true
        return searchB
    }()
    
    lazy var myTalbeView : UITableView = {
        let y = CGRect.getMaxY(obj: searchBar)
        let tableView = UITableView.init(frame: CGRect.getFrame(x: 0, y: y, w: SWIDTH, h: SHEIGHT-y-50), style: UITableView.Style.plain)
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = 64
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
}

