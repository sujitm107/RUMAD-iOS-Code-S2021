//
//  ViewController.swift
//  ContactsApp
//
//  Created by Sujit Molleti on 2/27/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    var names: [String] = []
    
    var namesDictionary: [Character : [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        sortNamesIntoDictionary()
        
    }
    
    func sortNamesIntoDictionary() {
        for name in names{
            addNameIntoDictionary(insert: name)
        }
        
    }
    
    func addNameIntoDictionary(insert name: String) {
        let firstChar = name[name.startIndex]
        var listAtChar = namesDictionary[firstChar] ?? []
        
        listAtChar.append(name)
        namesDictionary[firstChar] = listAtChar
    }
    
    @IBAction func didTapAddContactButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Contact", message: "What is the name of your new friend?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
            guard let newName = alert.textFields![0].text else { return }
            
            if newName.trimmingCharacters(in: .whitespacesAndNewlines) == "" { return }
            self.addNameIntoDictionary(insert: newName)
            self.contactsTableView.reloadData()
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    

//MARK: TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return namesDictionary.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "\(namesDictionary.keys.sorted()[section])" // A, B, C
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = namesDictionary.keys.sorted()[section] // A, B, C
        return namesDictionary[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let key = namesDictionary.keys.sorted()[indexPath.section]
         
        cell.textLabel!.text = namesDictionary[key]![indexPath.row]
        
        return cell
        
    }
}

