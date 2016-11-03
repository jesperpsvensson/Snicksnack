//
//  InfoVC.swift
//  Skitsnack
//
//  Created by Jesper Svensson on 2016-04-17.
//  Copyright © 2016 Jesper Svensson. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func feedbackBtnTapped(_ sender: AnyObject) {
        let url = URL(string: "mailto:jesperpsvensson@gmail.com")
        UIApplication.shared.openURL(url!)
    }
    
    @IBAction func cancelBtnTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }


}
