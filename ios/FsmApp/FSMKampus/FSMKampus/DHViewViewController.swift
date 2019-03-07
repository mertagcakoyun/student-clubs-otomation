//
//  DHViewViewController.swift
//  FSMKampus
//
//  Created by Mert Agcakoyun on 6.12.2018.
//  Copyright © 2018 Mert Agcakoyun. All rights reserved.
//

import UIKit

class DHViewViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var menuText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = date()
        passData(date: Date())
    }
    
    func tomorrow() ->  Date {
        let dateString = self.dateLabel.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateFromString = dateFormatter.date(from: dateString!)
        var dateComponents = DateComponents()
        dateComponents.setValue(1, for: .day); // +1 day
        let tomorrow = Calendar.current.date(byAdding: dateComponents, to: dateFromString!)  // Add the DateComponents
        return tomorrow!
    }
    
    func yesterday() ->  Date {
        let dateString = self.dateLabel.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateFromString = dateFormatter.date(from: dateString!)
        var dateComponents = DateComponents()
        dateComponents.setValue(-1, for: .day); // +1 day
        let yesterday = Calendar.current.date(byAdding: dateComponents, to: dateFromString!)  // Add the DateComponents
        return yesterday!
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: tomorrow())
        self.dateLabel.text = result
        self.menuText.text.removeAll()
        passData(date: formatter.date(from: result)!)
        
    }
    @IBAction func backButton(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: yesterday())
        self.dateLabel.text = result
        self.menuText.text.removeAll()
        passData(date: formatter.date(from: result)!)
    }
    func date() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    func passData(date: Date){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        var isContain = false
        let jsonuRL = "https://sheets.googleapis.com/v4/spreadsheets/1kgxnFxb9pOkPvKHMAqsMFbh5LrMYTrftUKyJQuBkR1o/values/yemekhane?key=AIzaSyDaIfxBmmFG875woD1RuKYugqCy5ZWMF48"
        guard let url = URL(string: jsonuRL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do{
                let menu = try JSONDecoder().decode(Menu.self, from: data!)
                
                DispatchQueue.main.sync(execute: {
                    for i in 0..<menu.values.count{
                        for j in 0..<menu.values[0].count{
                            if result == menu.values[i][0]{
<<<<<<< HEAD
                                self.menuTextView.text! += ("\(menu.values[i][j]) \n")
=======
                                self.menuText.text += ("\(menu.values[i][j]) \n")
>>>>>>> master
                                isContain = true
                            }
                        }
                    }
                    if isContain == false{
<<<<<<< HEAD
                        self.menuTextView.text! += "Bugün yemekhane kapalı!"
=======
                        self.menuText.text += "Bugün yemekhane kapalı!"
>>>>>>> master
                    }
                })
                
                
                
            }catch let err{
                print(err)
                
            }
            }.resume()
        
        
    }
    

    
    

}
