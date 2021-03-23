//
//  ContactsViewController.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 3/2/21.
//

import UIKit

protocol ContactDelegate {
    func addNewContact(contact: Contact)
}

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ContactDelegate {
    

    @IBOutlet weak var contactsTableView: UITableView!
    
    var names: [String] = ["Steph", "Tim", "Steve", "Sofia", "Ana", "Ryan", "John"]
    
    var contacts: [Contact] = []
    
    var contactsDictionary: [Character: [Contact]] = [:]
    var namesDictionary: [Character:[String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        contacts.append(Contact(name: "Mark Rober", image: UIImage(named: "Mark")!, phone: "111111111", address: "Rutgers University"))
        contacts.append(Contact(name: "Margot Robbie", image: UIImage(named: "Margot")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Leonardo Dicaprio", image: UIImage(named: "Leo")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Brad Pitt", image: UIImage(named: "Brad")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Shawn Mendes", image: UIImage(named: "Shawn")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Bill Gates", image: UIImage(named: "Bill")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        
        sortContactsIntoDictionary()
        sortTheNames()
        
    }
    
    func sortContactsIntoDictionary(){
        
        for contact in contacts {
            addToContactsDictionary(insert: contact)
        }
        
    }
    
    func addToContactsDictionary(insert contact: Contact){
        let name = contact.name
        let firstChar = name[name.startIndex]
        
        var list = contactsDictionary[firstChar] ?? []
        list.append(contact)
        
        contactsDictionary[firstChar] = list
        
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
        
//        let alert = UIAlertController(title: "New Contact", message: "Add a new friend's name", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        alert.addTextField(configurationHandler: nil)
//
//        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
//            let newName = alert.textFields![0].text
//
//            if newName?.trimmingCharacters(in: .whitespacesAndNewlines) == "" { return }
//
//            self.addToDictionary(insert: newName!)
//
//            self.contactsTableView.reloadData()
//        }))
//
//        self.present(alert, animated: true, completion: nil)
        
        performSegue(withIdentifier: "AddNewContactSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AddNewContactSegue"){
            let dest = segue.destination as! AddContactViewController
            dest.addContactDelegate = self
        }
    }
    
    
    //MARK: TableView Methods
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(contactsDictionary.keys.sorted()[section])" // A, B, C
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let letter = contactsDictionary.keys.sorted()[section] //A, B, C
        let list = contactsDictionary[letter]! //array
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        
        let letter = contactsDictionary.keys.sorted()[indexPath.section] //A, B, C
        
//        let list = namesDictionary[letter]! // Amy, Alex
        
        let list  = contactsDictionary[letter]!
        
        let contact = list[indexPath.row]
        
        cell.setUpCell(contact: contact)
        
//        cell.textLabel!.text = list[indexPath.row]
        
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func addNewContact(contact: Contact) {
        addToContactsDictionary(insert: contact)
        contactsTableView.reloadData()
    }
    
    /*
     In the background
     
     for (int index = 0; index<rowInSection; index++){
        tableView(contactsTableView, cellForRowAt: index)
     }
     
     
     */
    
    
    
}
