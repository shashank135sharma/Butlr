//
//  AddTaskViewController.swift
//  Butlr
//
//  Created by Shashank Sharma on 9/25/16.
//  Copyright © 2016 Shashank Sharma. All rights reserved.
//

import Foundation
import UIKit

class AddTaskViewController :UIViewController {
    var listManager = ListManager.sharedInstance;
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    
    
    override func viewDidLoad() {
        datePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
    }
    
    override func viewDidAppear(animated: Bool) {
        datePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
    }

    @IBAction func doneButton(sender: AnyObject) {
        listManager.addTaskToList(listManager.currentLocation, TaskName: titleTextField.text!);
        print(descriptionTextField.text);
        listManager.addDescription(titleTextField.text!, description: descriptionTextField.text!);
        listManager.addDateToList(titleTextField.text!, date: datePicker.date);
        listManager.getDescriptionList()
        listManager.getTasksList()
        navigationController?.popViewControllerAnimated(true);
    }
}
