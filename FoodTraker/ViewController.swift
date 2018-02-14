//
//  ViewController.swift
//  FoodTraker
//
//  Created by Matheus Freitas Venosa on 28/03/17.
//  Copyright © 2017 Matheus Freitas Venosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToList: UIButton!
    @IBOutlet weak var mealName: UITextField!
    
    var fruits = ["banana", "maça", "pera", "uva"];

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier = "Cell";
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath);
        // Fetch Fruit
        let fruit = fruits[indexPath.row]
        
        // Configure Cell
        cell.textLabel?.text = fruit
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath);
        showAlert(message: fruits[indexPath.row]);
    }
    
    @IBAction func incrementArray(_ sender: Any) {
        
        fruits.insert(self.mealName.text!, at: 0);
        self.tableView.reloadData();
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Meal", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }


}

