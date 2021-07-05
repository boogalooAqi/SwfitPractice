//
//  TabVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/21.
//

import UIKit

class TabVC: UITabBarController {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //一共包含了两个视图
        let VCA = TabSubA()
        VCA.title = "1024"
        let VCB = TabSubB()
        VCB.title = "91"
         
        //分别声明两个视图控制器
        let main = UINavigationController(rootViewController:VCA)
        main.tabBarItem = UITabBarItem.init(tabBarSystemItem: .more, tag: 0)
        //定义tab按钮添加个badge小红点值
//        main.tabBarItem.badgeValue = "!"
         
        let setting = UINavigationController(rootViewController:VCB)
        setting.tabBarItem = UITabBarItem.init(tabBarSystemItem: .bookmarks, tag: 1)
        self.viewControllers = [main,setting]
         
        //默认选中的是游戏主界面视图
        self.selectedIndex = 0
    }
}
