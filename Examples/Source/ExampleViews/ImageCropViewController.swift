//
//  ImageCropViewController.swift
//  Examples
//
//  Created by kentjia on 2018/6/14.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

class ImageCropViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    
    private var startPoint: CGPoint? = nil
    private var endPoint: CGPoint? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView2.contentMode = .center
        
        self.imageView1.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:)))
        self.imageView1.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func crop(_ sender: Any) {
        if let start = self.startPoint, let end = self.endPoint {
            if let image = self.imageView1.sl_snapshotImage(afterScreenUpdates: false) {
                
                let rect = CGRect(startPoint: start, endPoint: end)
                if let croppedImage = image.sl_crop(toRect: rect) {
                    self.imageView2.image = croppedImage
                }
                
                self.startPoint = nil
                self.endPoint = nil
                
                self.printPointInfo()
            } else {
                self.infoLabel.text = "No Screen Shot Image"
            }
        } else {
            self.infoLabel.text = "点击图片选择起始和结束点"
        }
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .recognized {
            guard let _ = self.startPoint else {
                self.startPoint = sender.location(in: self.imageView1)
                self.printPointInfo()
                return
            }
            guard let _ = self.endPoint else {
                self.endPoint = sender.location(in: self.imageView1)
                self.printPointInfo()
                return
            }
        }
    }
    
    private func printPointInfo() {
        var msg = " "
        if let pt = self.startPoint {
            msg += "start x:\(Int(pt.x)), y :\(Int(pt.y)) "
        }
        if let pt = self.endPoint {
            msg += "end x:\(Int(pt.x)), y :\(Int(pt.y))"
        }
        self.infoLabel.text = msg
    }
}
