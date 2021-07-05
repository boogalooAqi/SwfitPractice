//
//  PickerVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/18.
//

import UIKit

class PickerVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var pickerView:UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView = UIPickerView()
        pickerView.dataSource = self;
        pickerView.delegate = self;
        //设置选择框的默认值
        pickerView.selectRow(1,inComponent:0,animated:true)
        pickerView.selectRow(2,inComponent:1,animated:true)
        pickerView.selectRow(3,inComponent:2,animated:true)
        self.view.addSubview(pickerView)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
         let button = UIButton(frame:CGRect(x:0, y:0, width:100, height:30))
         button.center = self.view.center
         button.backgroundColor = UIColor.blue
         button.setTitle("获取信息",for:.normal)
         button.addTarget(self, action:#selector(getPickerViewValue),
                          for: .touchUpInside)
         self.view.addSubview(button)
    }
    
    //MARK:- delegate
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
     
    //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
     
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return String(row)+"-"+String(component)
    }
    
    //MARK:- func
    
    //触摸按钮时，获得被选中的索引
     @objc func getPickerViewValue(){
         let message = String(pickerView.selectedRow(inComponent: 0)) + "-"
             + String(pickerView!.selectedRow(inComponent: 1)) + "-"
             + String(pickerView.selectedRow(inComponent: 2))
         let alertController = UIAlertController(title: "被选中的索引为",
                                                 message: message, preferredStyle: .alert)
         let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
         alertController.addAction(okAction)
         self.present(alertController, animated: true, completion: nil)
     }
}
