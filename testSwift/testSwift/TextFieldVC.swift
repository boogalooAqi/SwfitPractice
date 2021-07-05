//
//  TextFieldVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/15.
//

import UIKit

class TextFieldVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        self.view.addSubview(self.myInputView)
        
    }
    
    // 回收键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIApplication.shared.windows.first?.endEditing(true)
    }
    
    // 监听输入
    @objc func clearPasswordTextFieldAndRememberPwd(tf:UITextField){
        if tf.text!.count > 7 {
            tf.text = String(tf.text!.prefix(7))
        }
        let info = ["data":tf.text!] 
        // 发送广播消息
        let obName = Notification.Name.init(rawValue: "changeTitle")
        NotificationCenter.default.post(name: obName, object: self, userInfo:info)
    }
    
    lazy var myInputView: UITextField = {
        let tf = UITextField.init(frame: CGRect.init(x: (self.view.frame.size.width-self.view.frame.size.width*0.8)/2, y: 100, width: self.view.frame.size.width*0.8, height: 45))
        tf.backgroundColor = UIColor.white
        tf.placeholder = "输入"
        tf.layer.cornerRadius = 2
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.clipsToBounds = true
        
        let imageV = UIImageView.init(frame:CGRect.init(x: 0, y: 0, width: 25, height: 25))
        imageV.image = UIImage.init(named: "tab_mine_selected@2")
        
        tf.leftView = imageV
        tf.leftViewMode = UITextField.ViewMode.always // .always
        tf.addTarget(self, action: #selector(clearPasswordTextFieldAndRememberPwd), for:.editingChanged)
        return tf
    }()
    
}
