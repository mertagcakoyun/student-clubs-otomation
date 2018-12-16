//
//  ClubViewController.swift
//  FSMKampus
//
//  Created by Mert Agcakoyun on 6.12.2018.
//  Copyright © 2018 Mert Agcakoyun. All rights reserved.
//

import UIKit

class ClubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
    @IBOutlet weak var tableView: UITableView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
     
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    
    

}
