//
//  ImagePickColorViewController.swift
//  Examples
//
//  Created by kentjia on 2018/6/14.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

class ImagePickColorViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView1.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(sender:)))
        self.imageView1.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .recognized {
            let pt = sender.location(in: self.imageView1)
            if let image = self.imageView1.sl_snapshotImage(afterScreenUpdates: false) {
                if let color = image.sl_color(atPoint: pt) {
                    self.infoLabel.text = color.hexString
                } else {
                    self.infoLabel.text = "No Color picked"
                }
            } else {
                self.infoLabel.text = "No Screen Shot Image"
            }
        }
    }
    
}
