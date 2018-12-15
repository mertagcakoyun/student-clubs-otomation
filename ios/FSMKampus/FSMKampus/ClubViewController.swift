//
//  ClubViewController.swift
//  FSMKampus
//
//  Created by Mert Agcakoyun on 6.12.2018.
//  Copyright © 2018 Mert Agcakoyun. All rights reserved.
//

import UIKit

class ClubViewController: UIViewController {
    
   
   
    struct Menu: Decodable{
        let range : String
        let majorDimension : String
        let values : [[String]]
        
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        let jsonuRL = "https://sheets.googleapis.com/v4/spreadsheets/1kgxnFxb9pOkPvKHMAqsMFbh5LrMYTrftUKyJQuBkR1o/values/kulupler?key=AIzaSyDaIfxBmmFG875woD1RuKYugqCy5ZWMF48"
        guard let url = URL(string: jsonuRL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do{
                let menu = try JSONDecoder().decode(Menu.self, from: data!)
                
                for i in 0..<menu.values.count{
                    for j in 0..<menu.values[i].count{
                        print(menu.values[i][j] + "\n" )
                        //self.KulupBilgiLabel.text = (menu.values[i][j]+"\n")
                        
                    }
                    
                    print("**")
                }
                
                
            }catch let err{
                print(err)
                
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
