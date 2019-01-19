//
//  EventViewController.swift
//  FSMKampus
//
//  Created by Mert Agcakoyun on 6.12.2018.
//  Copyright © 2018 Mert Agcakoyun. All rights reserved.
//

import UIKit
struct Event:Decodable{
    let range : String
    let majorDimension : String
    let values : [[String]]
    
}
class EventViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTVCell
        cell.EventNameTF.text = "Geek Out Time";
        cell.DescriptionTF.text="Teknoloji gündemi hakkında haftalık sohbet";
        cell.InformationTF.text = "12/05/2018\n18:00\nD105 - Haliç Kampüsü\nYeni Nesil ARGE" ;
        
        return cell
    }
    
    func date() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    func passData(){
        let result = date()
        var isContain = false
        let jsonuRL = "https://sheets.googleapis.com/v4/spreadsheets/1kgxnFxb9pOkPvKHMAqsMFbh5LrMYTrftUKyJQuBkR1o/values/yemekhane?key=AIzaSyDaIfxBmmFG875woD1RuKYugqCy5ZWMF48"
        guard let url = URL(string: jsonuRL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do{
                let menu = try JSONDecoder().decode(Menu.self, from: data!)
                
                DispatchQueue.main.async {
                    for i in 0..<menu.values.count{
                        for j in 0..<menu.values[0].count{
                            if result == menu.values[i][0]{
                               // self.menuText.text = ("\(menu.values[i][j]) \n")
                                isContain = true
                            }
                        }
                    }
                    
                }
                
                
                
            }catch let err{
                print(err)
                
            }
            }.resume()
    
    

}
}
