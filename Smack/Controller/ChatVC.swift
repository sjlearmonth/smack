//
//  ChatVC.swift
//  Smack
//
//  Created by Stephen Learmonth on 02/02/2018.
//  Copyright © 2018 Devslopes. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success ) in
                NotificationCenter.default.post(name: NOTIF_USER_DID_CHANGE, object: nil)
            })
    
            MessageService.instance.findAllChannel(completion: { (success) in
                
            })
        }
    }
}
