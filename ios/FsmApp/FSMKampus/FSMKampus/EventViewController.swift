//
//  EventViewController.swift
//  FSMKampus
//
//  Created by Mert Agcakoyun on 6.12.2018.
//  Copyright © 2018 Mert Agcakoyun. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var events: [[String]] = [[String]]()

    @IBOutlet weak var eventTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonuRL = "https://sheets.googleapis.com/v4/spreadsheets/1kgxnFxb9pOkPvKHMAqsMFbh5LrMYTrftUKyJQuBkR1o/values/etkinlikler?key=AIzaSyDaIfxBmmFG875woD1RuKYugqCy5ZWMF48"
        guard let url = URL(string: jsonuRL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do{
                var club = try JSONDecoder().decode(Club.self, from: data!)
                club.values.remove(at: 0)
                self.events = club.values
                DispatchQueue.main.sync(execute: {
                    
                    self.eventTable.reloadData()
                    
                })
                
                
                
            }catch let err{
                print(err)
                
            }
            }.resume()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as! EventTableViewCell
        cell.nameLabel.text = events[indexPath.row][5]
        cell.eventNameLabel.text = events[indexPath.row][0]
        cell.dateLabel.text = events[indexPath.row][2] + " " + events[indexPath.row][3]
        cell.placeLabel.text = events[indexPath.row][4]
        
        let image = events[indexPath.row][7]
        let url = URL(string: image)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                cell.eventImage.image = UIImage(data: data!)
            }
        }).resume()
        return cell
    }
    

}
