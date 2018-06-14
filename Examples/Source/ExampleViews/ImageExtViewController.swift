//
//  ImageExtViewController.swift
//  Examples
//
//  Created by kentjia on 2018/6/12.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit

class ImageExtViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet weak var imageView6: UIImageView!
    @IBOutlet weak var imageView7: UIImageView!
    @IBOutlet weak var imageView8: UIImageView!
    
    @IBOutlet weak var imageView9: UIImageView!
    @IBOutlet weak var imageView10: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建纯色图片
        self.imageView1.image = UIImage.sl_image(withColor: UIColor.green, size: self.imageView1.bounds.size)
        self.imageView2.image = UIImage.sl_image(withColor: UIColor.blue, size: self.imageView2.bounds.size)
        
        // 创建边框图片(TBD 需要优化，fill和border颜色叠加了)
        self.imageView3.image = UIImage.sl_image(fillColor: UIColor.clear, borderColor: UIColor.red, borderWidth: 1.0, size: self.imageView3.bounds.size, opaque: false, scale: 0.0, cornerRadius: 0.0)
        self.imageView4.image = UIImage.sl_image(fillColor: UIColor.clear, borderColor: UIColor.red, borderWidth: 4.0, size: self.imageView4.bounds.size, opaque: false, scale: 0.0, cornerRadius: self.imageView4.bounds.height/2.0)
        self.imageView5.image = UIImage.sl_image(fillColor: UIColor.clear, borderColor: UIColor.red, borderWidth: 4.0, size: self.imageView5.bounds.size, opaque: false, scale: 0.0, cornerRadius: 10.0)
        
        // tint image
        let deleteImage = #imageLiteral(resourceName: "delete")
        let color = UIColor(RGBAValue: 0xFF0000FF)
        self.imageView6.image = deleteImage.sl_tint(tintColor: color, mode: .sourceAtop)
        self.imageView7.image = deleteImage.sl_tint(tintColor: UIColor.blue, mode: .sourceAtop)
        self.imageView8.image = deleteImage.sl_tint(tintColor: UIColor.blue, mode: .sourceIn)
        
        // fill alpha
        self.imageView9.image = deleteImage.sl_fillAlpha(fillColor: UIColor.blue)
        self.imageView10.image = deleteImage.sl_fillAlpha(fillColor: UIColor.green)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
