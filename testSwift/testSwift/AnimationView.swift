//
//  AnimationView.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/15.
//

import UIKit

class AnimationView: UIView {
    // 声明本Class全局对象view
    lazy var baseView : UIView = UIView ()
    
    // init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        
        // 加载view
        setUpSubViews()
        // 添加事件
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hidden))
        self.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 显示
    func show(){
        UIApplication.shared.windows.first?.addSubview(self)
        self.baseView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        self.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.baseView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.alpha = 1
        }
    }
    
    // 消失
    @objc func hidden(){
        UIView.animate(withDuration: 0.25) {
            self.alpha = 0
        } completion: {(complete) in
            self.removeFromSuperview()
        }

    }
    
    func setUpSubViews(){
        baseView = UIView.init(frame: CGRect.init(x: (self.frame.size.width-self.frame.size.width*0.8)/2, y: 100, width: self.frame.size.width*0.8, height: 300))
        baseView.layer.cornerRadius = 10
        baseView.clipsToBounds = true
        baseView.backgroundColor = .HEX(0x398ad9)
        self.addSubview(self.baseView)
    }
}
