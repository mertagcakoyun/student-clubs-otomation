//
//  Data.swift
//  FSMKampus
//
//  Created by mehmet özcan on 27.01.2019.
//  Copyright © 2019 Mert Agcakoyun. All rights reserved.
//

import Foundation
import UIKit

class Data {
    
    static var name = "ali"
    
    public func passinggData() {
        
    
        let jsonuRL = "https://sheets.googleapis.com/v4/spreadsheets/1kgxnFxb9pOkPvKHMAqsMFbh5LrMYTrftUKyJQuBkR1o/values/yemekhane?key=AIzaSyDaIfxBmmFG875woD1RuKYugqCy5ZWMF48"
        guard let url = URL(string: jsonuRL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do{
                let menu = try JSONDecoder().decode(Menu.self, from: data!)
                
                DispatchQueue.main.sync(execute: {
                Data.name = "ayse"
                })
                
                
                
            }catch let err{
                print(err)
                
            }
            }.resume()
        
       
    }
    
    
    
    
}


