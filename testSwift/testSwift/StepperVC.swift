//
//  StepperVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/18.
//

import UIKit

class StepperVC: UIViewController {
    
    var stepper : UIStepper!
    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper = UIStepper()
        stepper.center = self.view.center
        
        //设置stepper的范围与初始值
        stepper.maximumValue = 10
        stepper.minimumValue = 1
        stepper.value = 5.5
        
        //设置每次增减的值
        stepper.stepValue = 0.5
        
        //设置stepper可以按住不放来连续更改值
        stepper.isContinuous = true
        
        //设置stepper是否循环（到最大值时再增加数值从最小值开始）
        stepper.wraps = false
        stepper.addTarget(self, action: #selector(stepperValueIschanged), for: .valueChanged)
        self.view.addSubview(stepper)
        
        label = UILabel(frame:CGRect.getFrame(x: 100, y: 190, w: 300, h: 30))
        label.text = "当前值为：\(stepper.value)"
        self.view.addSubview(label)
        
    }
    
    @objc func stepperValueIschanged(){
        label.text="当前值为：\(stepper.value)"
    }
}
