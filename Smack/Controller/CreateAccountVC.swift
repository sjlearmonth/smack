//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Stephen Learmonth on 05/02/2018.
//  Copyright © 2018 Devslopes. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
