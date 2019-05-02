//
//  LogBookViewController.swift
//  PuttingItAllTogetherV01
//
//  Created by Oliver Brotherhood on 02/04/2019.
//  Copyright © 2019 Oliver Brotherhood. All rights reserved.
//

import UIKit

class LogBookViewController: UIViewController {
    
    @IBOutlet weak var bloodReadingsHolder: UITextView!
 
    var fileURL:URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bloodReadingsHolder.text = loadData()
    }
    
    @IBAction func clearBloodReadingData(_ sender: Any) {
        clearData()
        bloodReadingsHolder.text = loadData()
    }
    
    
    func loadData() -> String{
        //Reading from the file
        
        let fileName = "test"
        let documentDirURL =  try!FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        var readString = ""
        
        do {
            readString = try String(contentsOf: fileURL)
        }catch let error as NSError{
            print("failed to read file")
            print(error)
        }

        
        return readString
    }
    
    func clearData(){
        //This function is used to clear the data that is stored within the blood-readings.txt file during testing
        
        let fileName = "test"
        let documentDirURL =  try!FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        do{
            
            let allData = ""
            try allData.write(to: fileURL, atomically:  true, encoding: String.Encoding.utf8)
            
        }catch let error as NSError{
            print("filed to write to url")
            print(error)
        }

        
        
    }

}
