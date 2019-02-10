//
//  ClubViewController.swift
//  FSMKampus
//
//  Created by Mert Agcakoyun on 6.12.2018.
//  Copyright © 2018 Mert Agcakoyun. All rights reserved.
//

import UIKit
import Alamofire
struct Club:Decodable{
    let range : String
    let majorDimension : String
    var values : [[String]]
    
}
class ClubViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var clubMenu: [[String]] = [[String]]()
   
    @IBOutlet weak var tableView: UITableView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonuRL = "https://sheets.googleapis.com/v4/spreadsheets/1kgxnFxb9pOkPvKHMAqsMFbh5LrMYTrftUKyJQuBkR1o/values/kulupler?key=AIzaSyDaIfxBmmFG875woD1RuKYugqCy5ZWMF48"
        guard let url = URL(string: jsonuRL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do{
                var club = try JSONDecoder().decode(Club.self, from: data!)
                club.values.remove(at: 0)
                self.clubMenu = club.values
                DispatchQueue.main.sync(execute: {
                    
                    self.tableView?.reloadData()
                    
                })
                
                
                
            }catch let err{
                print(err)
                
            }
            }.resume()
    
    
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return self.clubMenu.count
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ClubTableViewCell
        cell.label1.text = clubMenu[indexPath.row][0]
        cell.label2.text = clubMenu[indexPath.row][3]
        
            let image = clubMenu[indexPath.row][5]
            let url = URL(string: image)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    cell.logoView.image = UIImage(data: data!)
                }
            }).resume()
        
        
        return cell
    }
    
    
    

}
