//
//  logoLbl.swift
//  Skitsnack
//
//  Created by Jesper Svensson on 2016-04-17.
//  Copyright © 2016 Jesper Svensson. All rights reserved.
//

import UIKit

class logoLbl: UILabel {

    override func awakeFromNib() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 65
    }

}
