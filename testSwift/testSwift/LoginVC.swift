//
//  LoginVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/24.
//

import UIKit

//登录框状态枚举
enum LoginShowType {
    case NONE,USER,PASS
}

class LoginVC: UIViewController,UITextFieldDelegate {
    
    // parameter
    // 输入框
    var input_account  :UITextField!
    var input_password : UITextField!
    
    // 手初始与头的 距离
    var offsetHand : CGFloat = 60
    
    // 遮眼睛图片
    var img_leftHand:UIImageView!
    var img_rightHand:UIImageView!
    
    // 圆形手图片
    var img_leftHandRound:UIImageView!
    var img_rightHandRound:UIImageView!
    
    // 登录框状态
    var showType:LoginShowType = LoginShowType.NONE
    
    // 获取屏幕尺寸
    let mainSize = Screen_Bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImageView()
        loadInputView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if showType == LoginShowType.PASS {
            showType = LoginShowType.NONE
            
            // 播放 不遮眼的动画
            animationAction(isOn: false)
        }
        // 回收键盘
        KWindow?.endEditing(true)
    }
    
    //MARK:-Delegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 开始编辑
        // 如果当前是用户名输入
        if textField.isEqual(input_account) {
            if showType != LoginShowType.PASS {
                showType = LoginShowType.USER
                return
            }
            showType = LoginShowType.USER

            // 播放 不遮眼的动画
            animationAction(isOn: false)
        }else{
            if showType == LoginShowType.PASS {
                return
            }
            showType = LoginShowType.PASS

            // 播放 遮眼的动画
            animationAction(isOn: true)
        }
    }
    
    func animationAction(isOn:Bool){
        if isOn == true {
            UIView.animate(withDuration: 0.5) {
                self.img_leftHand.frame = CGRect.getFrame(
                    x: self.img_leftHand.frame.origin.x+self.offsetHand,
                    y: self.img_leftHand.frame.origin.y-30,
                    w: self.img_leftHand.frame.size.width,
                    h: self.img_leftHand.frame.size.height)
                
                self.img_rightHand.frame = CGRect.getFrame(
                    x:self.img_rightHand.frame.origin.x-48,
                    y:self.img_rightHand.frame.origin.y-30,
                    w:self.img_rightHand.frame.size.width,
                    h:self.img_rightHand.frame.size.height)
                
                self.img_leftHandRound.frame = CGRect.getFrame(
                    x:self.img_leftHandRound.frame.origin.x+70,
                    y:self.img_leftHandRound.frame.origin.y,
                    w:0,
                    h:0)
                self.img_rightHandRound.frame = CGRect.getFrame(
                    x:self.img_rightHandRound.frame.origin.x-30,
                    y:self.img_rightHandRound.frame.origin.y,
                    w:0,
                    h:0)
            }
        }
        else{
            UIView.animate(withDuration: 0.5) {
                self.img_leftHand.frame = CGRect.getFrame(
                    x: self.img_leftHand.frame.origin.x-self.offsetHand,
                    y: self.img_leftHand.frame.origin.y+30,
                    w: self.img_leftHand.frame.size.width,
                    h: self.img_leftHand.frame.size.height)
                
                self.img_rightHand.frame = CGRect.getFrame(
                    x:self.img_rightHand.frame.origin.x+48,
                    y:self.img_rightHand.frame.origin.y+30,
                    w:self.img_rightHand.frame.size.width,
                    h:self.img_rightHand.frame.size.height)
                
                self.img_leftHandRound.frame = CGRect.getFrame(
                    x:self.img_leftHandRound.frame.origin.x-70,
                    y:self.img_leftHandRound.frame.origin.y,
                    w:40,
                    h:40)
                self.img_rightHandRound.frame = CGRect.getFrame(
                    x:self.img_rightHandRound.frame.origin.x+30,
                    y:self.img_rightHandRound.frame.origin.y,
                    w:40,
                    h:40)
            }
        }
    }
    
    //MARK:-UI
    func loadImageView(){
        
        //猫头鹰头部
        let img_owl = UIImageView.init(frame: CGRect.getFrame(x:mainSize.width/2-211/2,y:100, w:211, h:109))
        img_owl.image = UIImage.init(named:"owl-login")
        img_owl.layer.masksToBounds = true
        self.view.addSubview(img_owl)

        //猫头鹰左手(遮眼睛的)
        let rectLeftHand = CGRect.getFrame(x:61-offsetHand, y:90, w:40, h:65)
        img_leftHand = UIImageView.init(frame:rectLeftHand)
        img_leftHand.image = UIImage.init(named:"owl-login-arm-left")
        img_owl.addSubview(img_leftHand)

        //猫头鹰右手(遮眼睛的)
        let rectRightHand = CGRect.getFrame(x:img_owl.frame.size.width/2+60, y:90, w:40, h:65)
        img_rightHand = UIImageView.init(frame:rectRightHand)
        img_rightHand.image = UIImage.init(named:"owl-login-arm-right")
        img_owl.addSubview(img_rightHand)
    }
    
    func loadInputView(){
        //登录框背景
        let img_backInput =  UIView.init(frame:CGRect.getFrame(x:15, y:200, w:mainSize.width-30, h:160))
        img_backInput.layer.borderWidth = 0.5
        img_backInput.layer.borderColor = UIColor.lightGray.cgColor
        img_backInput.backgroundColor = UIColor.white
        self.view.addSubview(img_backInput)
            
        //猫头鹰左手(圆形的)
        let rectLeftHandGone = CGRect.getFrame(x:mainSize.width/2-100,
                                               y:img_backInput.frame.origin.y-22, w:40, h:40)
        img_leftHandRound = UIImageView(frame:rectLeftHandGone)
        img_leftHandRound.image = UIImage(named:"icon_hand")
        self.view.addSubview(img_leftHandRound)
            
        //猫头鹰右手(圆形的)
        let rectRightHandGone = CGRect.getFrame(x:mainSize.width/2+62,
                                                y:img_backInput.frame.origin.y-22, w:40, h:40)
        img_rightHandRound = UIImageView(frame:rectRightHandGone)
        img_rightHandRound.image = UIImage(named:"icon_hand")
        self.view.addSubview(img_rightHandRound)
        
        // accout tf
        input_account = creatTextfieldUI(placeholder: "请输入用户名",
                                      textColor: UIColor.HEX(0x398ad9),
                                      fontSize: 16,
                                      cornerRadius: 2,
                                      backgroudColor: UIColor.white,
                                      isAcc: true,
                                      frame: CGRect.getFrame(x:30, y:30, w:img_backInput.frame.size.width-60, h:44))
        img_backInput.addSubview(input_account)
        
        // password tf
        input_password = creatTextfieldUI(placeholder: "请输入密码",
                                      textColor: UIColor.red,
                                      fontSize: 16,
                                      cornerRadius: 2,
                                      backgroudColor: UIColor.white,
                                      isAcc: false,
                                      frame: CGRect.getFrame(x:30, y:CGRect.getMaxY(obj: input_account)+30, w:img_backInput.frame.size.width-60, h:44))
        img_backInput.addSubview(input_password)
    }
    
    func creatTextfieldUI(placeholder:String,textColor:UIColor,
                          fontSize:CGFloat,cornerRadius:CGFloat,
                          backgroudColor:UIColor,isAcc:Bool,
                          frame:CGRect) -> UITextField{
        let tf = UITextField(frame: frame)
        tf.backgroundColor = backgroudColor
        tf.textColor = textColor
        tf.placeholder = placeholder
        tf.layer.cornerRadius = cornerRadius
        tf.font = UIFont.systemFont(ofSize: fontSize)
        tf.clipsToBounds = true
        tf.delegate = self
        tf.leftViewMode = .always
        tf.leftView = UIView.init(frame: CGRect.getFrame(x: 0, y: 0, w: tf.frame.size.height, h: tf.frame.size.height))
        
        // 图标
        let imageV = UIImageView.init(frame:CGRect.init(x: 0, y: 0, width: 22, height: 22))
        if isAcc == true {
            imageV.image = UIImage.init(named: "iconfont-user")
        }else{
            imageV.image = UIImage.init(named: "iconfont-password")
            tf.isSecureTextEntry = true
        }
        imageV.center = CGPoint.init(x: (tf.leftView?.frame.size.width)!/2 ,
                                     y: (tf.leftView?.frame.size.height)!/2)
        tf.leftView?.addSubview(imageV)
        return tf
    }
}
