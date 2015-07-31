//
//  DetailViewController.swift
//  CallUp
//
//  Created by Utsav Patel on 7/28/15.
//  Copyright (c) 2015 Utsav Patel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //@IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var altPhoneField: UITextField!
    @IBOutlet var emailField: UITextField!
    


    var detailItem: User? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if nameField != nil {
            nameField.text = detail.name
            phoneField.text = detail.phone
            altPhoneField.text = detail.altPhone
            emailField.text = detail.email
            }
        }
        
           }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

