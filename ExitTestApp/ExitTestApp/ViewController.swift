//
//  ViewController.swift
//  ExitTestApp
//
//  Created by Kirankumar Bollem on 12/28/18.
//  Copyright © 2018 Kirankumar Bollem. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderviewDelagate{

    @IBOutlet weak var tableViewController: UITableView!
    
    var sections = [
        Section(country: "India", states: ["Andrapradesh", "Telangana", "TamilNadu",], expanded:                        false),
        Section(country: "USA", states: ["California", "Teaxs","Florida"], expanded: false),
        Section(country: "Australia", states: ["Victoria", "QueensLand", "Tasmania"], expanded: false)
                     ]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func EditBarButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let SecondViewController = storyBoard.instantiateViewController(withIdentifier: "second")
        
        self.navigationController?.pushViewController(SecondViewController, animated: true)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].states.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded){
            return 50
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderVew()
        header.customInit(title: sections[section].country, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].states[indexPath.row]
        return cell
        }
    
    func toggleSection(header: ExpandableHeaderVew, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableViewController.beginUpdates()
        for i in 0 ..< sections[section].states.count{
            tableViewController.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableViewController.endUpdates()
}

}


