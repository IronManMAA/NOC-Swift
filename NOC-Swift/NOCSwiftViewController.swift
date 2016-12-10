//
//  ViewController.swift
//  NOC-Swift
//
//  Created by Marco Almeida on 12/6/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

import UIKit
import Foundation

class NOCSwiftViewController: UITableViewController
{

// MARK: Declare Variables and Constants

    //    var api: APIController!
    var nameCoverArray = [String]()
    var realNameArray = [String]()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
// MARK: Read JSon File and Parse Data into an Array
        
    //print("Got up to here-0")
        
        let bundle = Bundle(for: type(of: self))
        if let theURL = bundle.url(forResource: "NOC", withExtension: "json") {
            do {
                let data = try Data(contentsOf: theURL)
//              if let parsedData = try? JSONSerialization.jsonObject(with: data) as! [String: Any] {
                if let parsedData = try? JSONSerialization.jsonObject(with: data) as! [Any] {
           //let tt = type(of: parsedData)
           //print(tt)
                if let array = parsedData as? [[String: Any]] {
                   nameCoverArray = array.map { $0["coverName"] as? String ?? "unavailable"}
                   realNameArray = array.map { $0["realName"] as? String ?? "unavailable"}
                    }
                    //        print(nameCoverArray)
                    //        print(nameCoverArray[0])
                    //        print(realNameArray[0])
                    //        print(parsedData)
                 }
            } catch {
                print(error)
            }
        }

        
    }

// MARK: Table View Controllers
    
    override func numberOfSections(in tableView: UITableView) -> Int {
//print("Got up to here-1")
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//print("Got up to here-2")
        return self.nameCoverArray.count
    
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgentCell", for: indexPath)
//        print("Got up to here1")
        cell.textLabel?.text = nameCoverArray[indexPath.row]
        cell.detailTextLabel?.text =  realNameArray[indexPath.row]
        return cell
    }

    

} // end of Class

