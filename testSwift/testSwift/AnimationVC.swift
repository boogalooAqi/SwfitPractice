//
//  AnimationVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/15.
//

import UIKit

class AnimationVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        creatButton(text: "点击弹出动画", fontSize: 14, textAligement: NSTextAlignment.center, backgroudColor: .red,tag:0,textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 250, width: 200, height: 45))
        
    }
    
    @objc func tapAction(){
        print("点击了动画")
        
        let animation = AnimationView.init(frame: self.view.bounds)
        animation.show()
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
