//
//  ViewController.swift
//  test
//
//  Created by dsj on 2018/12/25.
//  Copyright © 2018年 dsj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: RadioButton!
    @IBOutlet weak var button2: RadioButton!
    @IBOutlet weak var button3: RadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.alternateButton = [button2, button3]
        button2.alternateButton = [button1, button3]
        button3.alternateButton = [button1, button2]
        
        NotificationCenter.default.addObserver(self, selector: #selector(buttonSelected), name: Notification.Name("buttonSelectedNotification"), object: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func buttonSelected(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo,
            let tag  = userInfo["tag"] as? Int else {
                return
        }
        print(tag);
    }

}

