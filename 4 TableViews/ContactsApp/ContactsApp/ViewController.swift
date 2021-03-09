//
//  ViewController.swift
//  ContactsApp
//
//  Created by Sujit Molleti on 2/27/21.
//

import UIKit

protocol ContactDelegate {
    func addNewContact(contact: Contact)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ContactDelegate {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    var names: [String] = []
    var namesDictionary: [Character : [String]] = [:]
    
    var contacts: [Contact] = []
    var contactsDictionary: [Character : [Contact]] = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contacts"
        
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        
        contacts.append(Contact(name: "Mark Rober", image: UIImage(named: "Mark")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Margot Robbie", image: UIImage(named: "Margot")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Leonardo Dicaprio", image: UIImage(named: "Leo")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Brad Pitt", image: UIImage(named: "Brad")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Shawn Mendes", image: UIImage(named: "Shawn")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        contacts.append(Contact(name: "Bill Gates", image: UIImage(named: "Bill")!, phone: "73211111111", address: "Rutgers Unversity, New Brunswick"))
        
        sortContactsIntoDictionary()
        sortNamesIntoDictionary()
        
        contactsTableView.reloadData()
        
    }
    
    func sortContactsIntoDictionary(){
        for contact in contacts{
            addContactIntoDictionary(insert: contact)
        }
    }
    
    func addContactIntoDictionary(insert contact: Contact){
        let name = contact.name
        let firstChar = name[name.startIndex]
        
        var listAtChar = contactsDictionary[firstChar] ?? []
        listAtChar.append(contact)
        contactsDictionary[firstChar] = listAtChar
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
        
        performSegue(withIdentifier: "addContactSegue", sender: nil)
        
//        let alert = UIAlertController(title: "New Contact", message: "What is the name of your new friend?", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        alert.addTextField(configurationHandler: nil)
//
//        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (UIAlertAction) in
//            guard let newName = alert.textFields![0].text else { return }
//
//            if newName.trimmingCharacters(in: .whitespacesAndNewlines) == "" { return }
//            self.addNameIntoDictionary(insert: newName)
//            self.contactsTableView.reloadData()
//
//        }))
//
//        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addContactSegue"){
            let vc = segue.destination as! AddContactViewController
            vc.addContactDelegate = self
        }
        
        if(segue.identifier == "ContactDetailSegue"){
            let vc = segue.destination as! ContactDetailViewController
            vc.contactInfo = sender as! Contact
        }
    }
    
    func addNewContact(contact: Contact) {
        addContactIntoDictionary(insert: contact)
        contactsTableView.reloadData()
    }
    

//MARK: TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsDictionary.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "\(contactsDictionary.keys.sorted()[section])" // A, B, C
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = contactsDictionary.keys.sorted()[section] // A, B, C
        return contactsDictionary[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as! ContactCell
        
        
        let key = contactsDictionary.keys.sorted()[indexPath.section]
        
        cell.setUpCell(contact: contactsDictionary[key]![indexPath.row])
        
        //current set up cell
        //cell.textLabel!.text = contactsDictionary[key]![indexPath.row].name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = contactsDictionary.keys.sorted()[indexPath.section]
        let contact = contactsDictionary[key]![indexPath.row]
        
        performSegue(withIdentifier: "ContactDetailSegue", sender: contact)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

