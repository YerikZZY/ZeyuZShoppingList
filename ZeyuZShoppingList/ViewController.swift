//
//  ViewController.swift
//  ZeyuZShoppingList
//
//  Created by Jay Zhang on 2/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    var itemList = [String]()

    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet var textFields: [UITextField]!
    
    @IBAction func listPressed(_ sender: UIButton) {
        itemList = []
        listLabel.text = "No item"
    }
    
    @IBAction func itemPressed(_ sender: UIButton) {
        for tf in textFields {
            tf.text = ""
        }
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        if textFields[0].text!.isEmpty && (textFields[1].text!.isEmpty || textFields[1].text == "0"){
            let title = "Error"
            let message = "Please enter description and quantity."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else if textFields[0].text!.isEmpty {
            let title = "Error"
            let message = "No description, please add item name."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else if textFields[1].text!.isEmpty || textFields[1].text == "0"{
            let title = "Error"
            let message = "No quantity, please add the number of the item you want to buy."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else{
            itemList.append("\(textFields[1].text!)x \(textFields[0].text!)")
            listLabel.text = itemList.joined(separator: "\n")
            
        }
    }
    
    @IBAction func editEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for tf in textFields {
            tf.resignFirstResponder()
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

