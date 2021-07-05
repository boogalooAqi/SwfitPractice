//
//  LabelVC.swift
//  testSwift
//
//  Created by KNIGHT_lishiqi on 2021/6/15.
//

import UIKit

class LabelVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        creatLabelUI(text: "测试创建Lable", fontSize: 14, textAligement: NSTextAlignment.center, backgroudColor: .red, textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 100, width: 200, height: 45))
        creatLabelUI(text: "测试创建Lable", fontSize: 18, textAligement: NSTextAlignment.center, backgroudColor: .yellow, textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 150, width: 200, height: 45))
        creatLabelUI(text: "测试创建Lable", fontSize: 20, textAligement: NSTextAlignment.center, backgroudColor: .blue, textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 200, width: 200, height: 45))
        creatLabelUI(text: "测试创建Lable", fontSize: 22, textAligement: NSTextAlignment.center, backgroudColor: .black, textColor: .white, frame:CGRect.init(x: (self.view.frame.size.width-200)/2, y: 250, width: 200, height: 45))
        
        // 生成图片View
        let _imageV: UIImageView = creatImageView(frame:CGRect.getFrame(x: SWIDTH/2-150, y: SHEIGHT/2, w: 300, h: 150))
        self.view.addSubview(_imageV)
        
        // 异步加载网络图片
        asynsLoadImage(url: "http://hangge.com/blog/images/logo.png", imageV: _imageV)
        
    }

    deinit {
        print("dealloc")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func creatLabelUI(text:String,fontSize:CGFloat ,
                      textAligement:NSTextAlignment,
                      backgroudColor:UIColor,
                      textColor:UIColor,frame:CGRect){
        let Label = UILabel.init(frame: frame)
        Label.font = UIFont.systemFont(ofSize: fontSize)
        Label.textAlignment = textAligement
        Label.text = text
        Label.backgroundColor = backgroudColor
        Label.textColor = textColor
        self.view.addSubview(Label)
    }
    
    func creatImageView(frame:CGRect) -> UIImageView{
        let imageView = UIImageView.init(frame: frame)
        imageView.backgroundColor = UIColor.white
        
        return imageView
    }
    
    func asynsLoadImage(url:String,imageV:UIImageView){
        let imageUrl = NSURL.init(string: url)
        let req : NSURLRequest = NSURLRequest.init(url: imageUrl! as URL)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: req as URLRequest) { (data, resp, error) -> Void in
            if error != nil{
                print(error.debugDescription)
            }else{
                let image = UIImage.init(data: data!)
                DispatchQueue.main.async {
                    imageV.image = image
                }
            }
        }
        dataTask.resume()
    }
}
