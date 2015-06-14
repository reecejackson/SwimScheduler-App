//
//  ClientInfoViewController.swift
//  SwimScheduler
//
//  Created by Reece Jackson on 6/9/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class ClientInfoViewController: UIViewController{//, UITableViewDelegate, UITableViewDataSource {

    var clientId:String!
    var lessonDates = ["1", "2", "3", "4"]
    var lessonTimes = [""]

    @IBOutlet var name: UILabel!
    //@IBOutlet var lessonDatesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lessonDatesTable.delegate = self
        //lessonDatesTable.dataSource = self
        
        var query = PFQuery(className: "clients")
        
        //put this into a refresh function to load once the data has been loaded
        if clientId != nil{
            
            query.getObjectInBackgroundWithId(clientId, block: { (object, error) -> Void in
            
                if let client = object {
                
                    let firstName = client["firstName"] as! String
                    let lastName = client["lastName"] as! String
                
                    self.name.text = firstName + " " + lastName
                
                } else {
                
                    println(error)
                
                }
            
            })
           
            //lessonDates.removeAll(keepCapacity: true)
            //lessonTimes.removeAll(keepCapacity: true)
            //getLessonsWithId(clientId)
            //lessonDatesTable.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getLessonsWithId(client: String) {
        
        var query = PFQuery(className: "lessons")
        query.whereKey("clientId", equalTo: clientId)
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if error == nil && objects != nil{
                
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        
                        var lessonDate = object.valueForKey("date") as! String
                        self.lessonDates.append(lessonDate)

                    }
                }
                
            }
            
        }
        
        //lessonDatesTable.reloadData()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    /*
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return lessonDates.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = lessonDatesTable.dequeueReusableCellWithIdentifier("dateCell", forIndexPath: indexPath) as! UITableViewCell
    
        cell.textLabel!.text = lessonDates[indexPath.row]
    
        return cell
    }
    
    /*
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            // Delete the lesson
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */*/
}

/*
class lessonDatesTableViewController: UITableViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        // MARK: - Table view data source

        
        /*
        // Override to support conditional editing of the table view.
        override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
        }
        */
    
        
        /*
        // Override to support rearranging the table view.
        override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        }
        */
        
        /*
        // Override to support conditional rearranging of the table view.
        override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
        }
        */
        
        /*
        // MARK: - Navigation
        
        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        }
        */
    
}*/