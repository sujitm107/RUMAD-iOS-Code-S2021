//
//  ContactsViewController.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 3/2/21.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var contactsTableView: UITableView!
    
    var names: [String] = ["Steph", "Tim", "Steve", "Sofia", "Ana", "Ryan", "John"]
    
    var namesDictionary: [Character:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        sortTheNames()
        
    }
    
    func sortTheNames(){
        //create lists, sets
        for name in names {
            addToDictionary(insert: name)
            
        }
        
    }
    
    func addToDictionary(insert name: String){
        let firstChar = name[name.startIndex] //getting the first index
        var list = namesDictionary[firstChar] ?? [] //get the list
        list.append(name)
        
        namesDictionary[firstChar] = list
    }
    
    
    @IBAction func didTapAddNameButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Contact", message: "Add a new friend's name", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
            let newName = alert.textFields![0].text
            
            if newName?.trimmingCharacters(in: .whitespacesAndNewlines) == "" { return }
            
            self.addToDictionary(insert: newName!)
            
            self.contactsTableView.reloadData()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    //MARK: TableView Methods
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(namesDictionary.keys.sorted()[section])" // A, B, C
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return namesDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let letter = namesDictionary.keys.sorted()[section] //A, B, C
        let list = namesDictionary[letter]! //array
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let letter = namesDictionary.keys.sorted()[indexPath.section] //A, B, C
        
        let list = namesDictionary[letter]! // Amy, Alex
        
        cell.textLabel!.text = list[indexPath.row]
        
        return cell;
        
    }
    
    /*
     In the background
     
     for (int index = 0; index<rowInSection; index++){
        tableView(contactsTableView, cellForRowAt: index)
     }
     
     
     */
    
    
    
}
