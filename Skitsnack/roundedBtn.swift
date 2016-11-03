//
//  roundedBtn.swift
//  Skitsnack
//
//  Created by Jesper Svensson on 2016-04-17.
//  Copyright © 2016 Jesper Svensson. All rights reserved.
//

import UIKit

class roundedBtn: UIButton {

    override func awakeFromNib() {
        
        self.layer.cornerRadius = 7.5
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        
    }

}
