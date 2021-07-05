//
//  ButtonVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/15.
//

import UIKit

class ButtonVC: UIViewController,UIActionSheetDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        creatButton(text: "测试创建Button1", fontSize: 14, textAligement: NSTextAlignment.center, backgroudColor: .red,tag: 0, textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 100, width: 200, height: 45))
        creatButton(text: "测试创建Button2", fontSize: 18, textAligement: NSTextAlignment.center, backgroudColor: .yellow,tag: 1, textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 170, width: 200, height: 45))
        creatButton(text: "测试创建Button3", fontSize: 20, textAligement: NSTextAlignment.center, backgroudColor: .blue,tag: 0, textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 250, width: 200, height: 45))
        creatButton(text: "测试创建Button4", fontSize: 22, textAligement: NSTextAlignment.center, backgroudColor: .black,tag: 1, textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 300, width: 200, height: 45))
    }
    
    @objc func tapAction(button:UIButton){
        print(button.titleLabel?.text ?? "")
        
        let alert = UIAlertController.init(title: "高氏资本", message: "做个测试", preferredStyle: UIAlertController.Style.alert)
        
        let actionSheet = UIAlertController.init(title: "高氏资本2", message: "做个测试2", preferredStyle: UIAlertController.Style.actionSheet)
        
        let action = UIAlertAction.init(title: "确定", style: .default) { (action) in
        }
        let action1 = UIAlertAction.init(title: "取消", style: .cancel) { (action) in
        }
        alert.addAction(action)
        alert.addAction(action1)
        actionSheet.addAction(action)
        actionSheet.addAction(action1)
        
        if button.tag == 1 {
            self.navigationController?.present(actionSheet, animated: true, completion: nil)
        }else{
            self .present(alert, animated: true, completion: nil)
        }
    }
    

    
    func creatButton(text:String,fontSize:CGFloat ,
                     textAligement:NSTextAlignment,
                     backgroudColor:UIColor,tag:Int,
                     textColor:UIColor,frame:CGRect){
        let button = UIButton.init(frame: frame)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.setTitle(text, for: UIControl.State.normal)
        button.titleLabel?.textAlignment = textAligement
        button.setTitleColor(textColor, for: UIControl.State.normal)
        button.setTitleColor(UIColor.red, for: UIControl.State.selected)
        button.backgroundColor = backgroudColor
        button.tag = tag
        button.addTarget(self, action: #selector(tapAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }
}
