//
//  DetailViewController.swift
//  RUMADContactsApp
//
//  Created by Sujit Molleti on 3/23/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = contact!.name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
