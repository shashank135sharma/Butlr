//
//  TasksListTableViewController.swift
//  Butlr
//
//  Created by Shashank Sharma on 9/24/16.
//  Copyright © 2016 Shashank Sharma. All rights reserved.
//

import UIKit
import NeuraSDK

class TasksListTableViewController: UITableViewController {
    var listManager = ListManager.sharedInstance;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1);
        self.navigationController!.navigationBar.translucent = false;
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()];
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    @IBAction func EnterLocation(sender: AnyObject) {
        var inputTextField: UITextField?
        //Create the AlertController
        let actionSheetController: UIAlertController = UIAlertController(title: "Add a List", message: "", preferredStyle: .Alert)
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Do some stuff
        }
        actionSheetController.addAction(cancelAction)
        //Create and an option action
        let nextAction: UIAlertAction = UIAlertAction(title: "Done", style: .Default) { action -> Void in
            if(!(inputTextField!.text?.isEmpty)!) {
                self.listManager.addLocation((inputTextField?.text)! as String);
                self.tableView.reloadData()
            }
        }
        actionSheetController.addAction(nextAction)
        actionSheetController.addTextFieldWithConfigurationHandler { textField -> Void in
            inputTextField = textField
            inputTextField?.placeholder = "Home, Groceries, etc.";
        }
        
        self.presentViewController(actionSheetController, animated: true, completion: nil)
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listManager.getTasksList().keys.count;

    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tasksListCell", forIndexPath: indexPath) as! TasksListTableViewCell;
        let listManagerKeys = Array(listManager.getTasksList().keys.sort()) as [String];
        cell.setUpCell(listManagerKeys[indexPath.row] as String, tasksRemaining: listManager.getTasksRemaining(listManagerKeys[indexPath.row]));
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let listManagerKeys = Array(listManager.getTasksList().keys.sort()) as [String];
        listManager.currentLocation = listManagerKeys[indexPath.row];
    }
    
    func loginToNeura() {
        var permissions = ["userStartedWalking", "userStartedRunning", "userStartedDriving", "userArrivedAtGroceryStore", "userStartedWorkOut", "userStartedSleeping", "userWokeUp"]
        NeuraSDK.sharedInstance().authenticateWithPermissions(permissions, onController: self, withHandler: {
            (token, error) in
            
            if ((token) != nil){
                
                NeuraSDK.sharedInstance().subscribeToEvent("userStartedWalking", identifier: "usw", webHookID: "dsad", state: "yes", completion: {
                    (responseData, error) in
                    let url = NSURL(string: "http://ngrokurl.io/usw")
                    
                    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    }
                    
                    task.resume()
                })
                
                NeuraSDK.sharedInstance().subscribeToEvent("userStartedRunning", identifier: "usr", webHookID: "dsad", state: "yes", completion: {
                    (responseData, error) in
                    let url = NSURL(string: "http://ngrokurl.io/usr")
                    
                    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    }
                    
                    task.resume()
                })
                
                NeuraSDK.sharedInstance().subscribeToEvent("userStartedDriving", identifier: "usd", webHookID: "dsad", state: "yes", completion: {
                    (responseData, error) in
                    let url = NSURL(string: "http://ngrokurl.io/usd")
                    
                    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    }
                    
                    task.resume()
                })
                
                
                NeuraSDK.sharedInstance().subscribeToEvent("userArrivedAtGroceryStore", identifier: "uag", webHookID: "dsad", state: "yes", completion: {
                    (responseData, error) in
                    let url = NSURL(string: "http://ngrokurl.io/uag")
                    
                    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    }
                    
                    task.resume()
                })
                
                NeuraSDK.sharedInstance().subscribeToEvent("userStartedWorkOut", identifier: "uwo", webHookID: "dsad", state: "yes", completion: {
                    (responseData, error) in
                    let url = NSURL(string: "http://ngrokurl.io/uwo")
                    
                    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    }
                    
                    task.resume()
                })
                
                NeuraSDK.sharedInstance().subscribeToEvent("userStartedSleeping", identifier: "uss", webHookID: "dsad", state: "yes", completion: {
                    (responseData, error) in
                    let url = NSURL(string: "http://ngrokurl.io/uss")
                    
                    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    }
                    
                    task.resume()
                })
                
                NeuraSDK.sharedInstance().subscribeToEvent("userWokeUp", identifier: "uwu", webHookID: "dsad", state: "yes", completion: {
                    (responseData, error) in
                    let url = NSURL(string: "http://ngrokurl.io/uwu")
                    
                    let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                        print(NSString(data: data!, encoding: NSUTF8StringEncoding))
                    }
                    
                    task.resume()
                })
                
                
            }
            else {
                
            }
            
        })
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
