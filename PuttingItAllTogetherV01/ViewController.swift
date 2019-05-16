//
//  ViewController.swift
//  PuttingItAllTogetherV01
//
//  Created by Oliver Brotherhood on 02/04/2019.
//  Copyright © 2019 Oliver Brotherhood. All rights reserved.
//

import UIKit

var currentScenceCheck = -1;
var sceneNames = ["scene01", "scene02", "scene03", "scene04", "scene05", "scene06", "scene07"]

var story = ["Once upon a time, in the land of pirates and gold, Seaweed Sid, Captain Peg Leg and Captain Grey Beard stood on the edge of a pier looking for adventure.",
"After walking down the pier, the captains appeared on the ship with pride, ready to set sail on the bright sea.",
"Taking up their positions, the captains watched as the sails were unrolled and the skull and crossbones was raised.",
"As the ship began to set sail, the captains decided on an island to explore. After a few days of sailing they arrived at their destination ",
"Landing on the island, the crew began to explore and spotted something in the distance. It was a large temple that they went to investigate.",
"As they entered the temple the walls began to glow with light. Slowly they began to climb the stairs.",
"At the back of the room was a large chest. Inside it was piles of gold and gems for the pirates to take on their next adventure."]

class ViewController: UIViewController {
    
    @IBOutlet weak var currentPage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        saveData(dataToBeSaved: "Oliver Brotherhood")
        currentPage.text = "\(currentScenceCheck)"
        
    }
    
    @IBAction func resetStory(_ sender: Any) {
        //Button that is used to reset the app
        currentScenceCheck = -1
        currentPage.text = "-1"
        
    }
    
    
    func saveData(dataToBeSaved: String){
        //Writting to the file
        let fileName = "currentpage"
        let documentDirURL =  try!FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        //print("File Path \(fileURL.path)")
        
        do{
            try dataToBeSaved.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            
        }catch let error as NSError{
            print("filed to write to url")
            print(error)
        }
    }

    func loadData() -> String{
        //Reading from the file
        
        let fileName = "currentpage"
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
    

}

