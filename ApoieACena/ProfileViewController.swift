//
//  ProfileViewController.swift
//  ApoieACena
//
//  Created by Felipe Montenegro on 3/31/17.
//  Copyright © 2017 Felipe Montenegro. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        textField.resignFirstResponder()
        
        return true
    }

}
