//
//  ImageDecompressionViewController.swift
//  Examples
//
//  Created by kentjia on 2018/12/23.
//  Copyright © 2018 jkstyle. All rights reserved.
//

import UIKit
import SLTools

class ImageDecompressionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DispatchQueue.global().async {
            if let url = Bundle.main.url(forResource: "ufc-fight.jpg", withExtension: nil),
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data) {
                
                let decompressedImage = image.sl_decompress()
                DispatchQueue.main.async {
                    self.imageView.image = decompressedImage
                }
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
