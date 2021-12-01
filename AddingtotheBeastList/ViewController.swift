//
//  ViewController.swift
//  AddingtotheBeastList
//
//  Created by faisal on 26/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inp: UITextField!
    @IBOutlet weak var table: UITableView!
    var list=["lion","cat","tiger","whale"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource=self
        table.delegate = self
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func beastadd(_ sender: UIButton) {
        list.insert(String(inp.text!), at: list.count)
        table.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
            list.remove(at: indexPath.row)
            tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
                // set text label to the model that is corresponding to the row in array
            cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    
}

