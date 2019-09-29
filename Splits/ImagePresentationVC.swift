//
//  ImagePresentationVC.swift
//  Splits
//
//  Created by Dante on 2019/9/28.
//  Copyright © 2019 cinderella. All rights reserved.
//

import UIKit

class ImagePresentationVC: UIViewController {

    // see relation of the connections(exist explicit or not)
    @IBOutlet weak var itemImageView: UIImageView!
    
    var image:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemImageView.image = image

    }


}

