//  PersonDetailsViewController.swift
//  GET People

import UIKit

class PersonDetailsViewController: UIViewController {

       var name = ""
       var gender = ""
       var mass = ""
       var birthYear = ""
    
       @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var genderLabel: UILabel!
       @IBOutlet weak var BirthYearLabel: UILabel!
       @IBOutlet weak var massLabel: UILabel!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           nameLabel.text = name
           genderLabel.text = gender
           massLabel.text = mass
           BirthYearLabel.text = birthYear
       }

}
