//
//  AddNewPerson.swift
//  DeathNote
//
//  Created by Liudmyla POHRIBNIAK on 4/04/19.
//  Copyright © 2019 Liudmyla POHRIBNIAK. All rights reserved.
//

import Foundation
import UIKit

extension AddNewPerson: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        newName.backgroundColor = UIColor(red: 1, green:1, blue: 1, alpha: 1.0)
        return true
    }
}


class AddNewPerson :UIViewController {
    
    var delegate: Done?
    var newPerson: Person!
    
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newDescription: UITextView!
    @IBOutlet weak var newDate: UIDatePicker!
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        newName.delegate = self
        newDate.minimumDate = Date()
        newDate.setDate(Date(), animated: true)

        let vc = navigationController?.viewControllers.first
            delegate = vc as? Done
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        if newName.text == "" {
            newName.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 205/255, alpha: 1.0)
            newName.placeholder = "Field is required"
            return
        }
        newPerson =  Person(newName.text!, newDescription.text! , newDate.date)
        delegate?.addPeople(person: newPerson)
        navigationController?.popToRootViewController(animated: true)
    }
}
