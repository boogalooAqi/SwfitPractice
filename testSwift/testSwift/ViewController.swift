//
//  ViewController.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/15.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "swift学习"
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(self.myTableView)
        
        // 修改返回按钮文字
        let item = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        
        // 增加一个监听
        let obName = Notification.Name.init(rawValue: "changeTitle")
        NotificationCenter.default.addObserver(self, selector: #selector(obEvent(notification:)), name: obName, object: nil)
    }
    
    deinit {
        // 移除监听
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func obEvent(notification:Notification){
        let userInfo = notification.userInfo!
        let content  = userInfo["data"] ?? "空值"
        print("我收到监听了! 内容是 :\(content)")
    }
    
    //MARK:- delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSources[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        print(cell?.textLabel?.text ?? "")
        
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(LabelVC(), animated: true)
        case 1:
            self.navigationController?.pushViewController(ButtonVC(), animated: true)
        case 2:
            self.navigationController?.pushViewController(TextFieldVC(), animated: true)
        case 3:
            self.navigationController?.pushViewController(TableViewVC(), animated: true)
        case 4:
            self.navigationController?.pushViewController(CollectionVC(), animated: true)
        case 5:
            self.navigationController?.pushViewController(AnimationVC(), animated: true)
        case 6:
            self.navigationController?.pushViewController(DateManagerVC(), animated: true)
        case 7:
            self.navigationController?.pushViewController(PickerVC(), animated: true)
        case 8:
            self.navigationController?.pushViewController(StepperVC(), animated: true)
        case 9:
            self.navigationController?.pushViewController(SearchVC(), animated: true)
        case 10:
            self.navigationController?.pushViewController(TabVC(), animated: true)
        case 11:
            self.navigationController?.pushViewController(LoginVC(), animated: true)
        case 12:
            self.navigationController?.pushViewController(AlamofireVC(), animated:true)
        default:
            break
        }
    }
    
    //MARK:- View
    lazy var myTableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = 40
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()


    lazy var dataSources : NSMutableArray = {
        var arr = NSMutableArray.init(array: ["Lable学习","Button学习",
                                              "UITextfield学习","UITableView学习"
                                              ,"UICollectoinView学习"
                                              ,"自定义动画弹出View"
                                              ,"日历管理器"
                                              ,"选择器"
                                              ,"步进器"
                                              ,"搜索"
                                              ,"标签VC"
                                              ,"动画登录界面"
                                              ,"Alamofire网络库"])
        return arr
    }()
}

