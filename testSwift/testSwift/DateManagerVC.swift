//
//  DateManagerVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/16.
//

import UIKit

class DateManagerVC: UIViewController {
    var _showTime : UILabel = UILabel.init()
    var _timer: Timer!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _timer.invalidate()
        _timer = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // 定时器
        _timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabelText), userInfo: nil, repeats: true)
        // 宽容度
        _timer.tolerance = 0.2

        
        
        let title : String = "当前时间:" + NSDate.getCurTimeString()
        _showTime = creatLabelUI(text: title,
                                 fontSize: 20,
                                 textAligement: NSTextAlignment.center,
                                 backgroudColor: UIColor.HEX(0x398ad9),
                                 textColor: UIColor.white,
                                 frame: CGRect.getFrame(x: 50, y: 300, w: SWIDTH-50*2, h: 80))
        self.view.addSubview(_showTime)
        
        // 日历选择器
        let datePicker = UIDatePicker.init(frame: CGRect.getFrame(x: 50, y: CGRect.getMaxY(obj: _showTime) + CGFloat(100), w: SWIDTH-50*2, h: 50))
        datePicker.locale = Locale.init(identifier: "zh_CN")
//        datePicker.backgroundColor = UIColor.HEX(0x398ad9)
        //datePicker.datePickerMode = .date
        //datePicker.datePickerMode = .time
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        self.view.addSubview(datePicker)
        
        
    }
    deinit {
        print("内存释放成功")
    }
    // 刷新时间线显示
    @objc func updateLabelText(){
        let timeText = "当前时间:" + NSDate.getCurTimeString()
        print(timeText)
        _showTime.text = timeText
    }
    
    // 日历选择器响应方法
    @objc func dateChanged(datePicker : UIDatePicker){
        // 更新提醒时间文本框
        let formatter = DateFormatter()
        // 日历样式
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print(formatter.string(from: datePicker.date))
    }
    
    func creatLabelUI(text:String,fontSize:CGFloat ,
                      textAligement:NSTextAlignment,
                      backgroudColor:UIColor,
                      textColor:UIColor,frame:CGRect) -> (UILabel){
        let Label : UILabel = UILabel.init(frame: frame)
        Label.font = UIFont.systemFont(ofSize: fontSize)
        Label.text = text
        Label.textAlignment = textAligement
        Label.backgroundColor = backgroudColor
        Label.textColor = textColor
        return Label
    }
}


extension NSDate {
    
    static func getCurTimeInterval() -> Int64 {
        let now = Date()
        let timeInterval: TimeInterval = now.timeIntervalSince1970
        return Int64(timeInterval)
    }
    
    static func getCurTimeString() -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return timeFormatter.string(from: date)
    }
    
    static func formatterTimeToDate(stringTime: String) -> Date {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dfmatter.timeZone = TimeZone(abbreviation: "UTC") ?? TimeZone.current
        let date = dfmatter.date(from: stringTime) ?? Date()
        return date
    }
    
    static func timeStampToString(timeStamp: String) -> String {
        let timeInterval: TimeInterval = TimeInterval(timeStamp) ?? Date().timeIntervalSince1970
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeInterval)
        return dfmatter.string(from: date)
    }
    
}
