//
//  EnterBloodReadingViewController.swift
//  PuttingItAllTogetherV01
//
//  Created by Oliver Brotherhood on 02/04/2019.
//  Copyright © 2019 Oliver Brotherhood. All rights reserved.
//

import UIKit

class EnterBloodReadingViewController: UIViewController {
    
    @IBOutlet weak var bloodReadingInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterButton(_ sender: Any) {
        saveData(dataToBeSaved: bloodReadingInput.text ?? "")
        
        if (currentScenceCheck < 6){
            currentScenceCheck += 1;
        }else{
            currentScenceCheck = -1;
        }
    
    }
    
    func saveData(dataToBeSaved: String){
        //Writting to the file
        let fileName = "test"
        let documentDirURL =  try!FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        //print("File Path \(fileURL.path)")
        
        do{
            
//            let writeString = "Hello World"
//            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            
            //Load in all the data and assign it to a variable then rewrite the file
            
            var allData = try String(contentsOf: fileURL);
            allData.append("\nBG: \(dataToBeSaved) - Time: \(hour):\(minutes)")
            
            try allData.write(to: fileURL, atomically:  true, encoding: String.Encoding.utf8)
            
            
        }catch let error as NSError{
            print("filed to write to url")
            print(error)
        }
    }
    
}
