//
//  MasterViewController.swift
//  CallUp
//
//  Created by Utsav Patel on 7/28/15.
//  Copyright (c) 2015 Utsav Patel. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var users : [User] = [User(name: "Utsav", phone: "6172078821", altPhone: "123321123", email: "usa"),
                          User(name: "Vansh", phone: "1232078123", altPhone: "123143532", email: "ban"),
                          User(name: "Sudhir", phone: "123532514", altPhone: "643153555", email: "jggt"),
                          User(name: "Varsha", phone: "123131333", altPhone: "643545345", email: "hufhr")]


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func thingDidChange(notification: NSNotification){
        if let changedThing = notification.object as? User{
            for(index, user) in enumerate(users){
                if user === changedThing {
                    let path = NSIndexPath(forItem: index, inSection: 0)
                    tableView.reloadRowsAtIndexPaths([path], withRowAnimation: .None)
                }
            }
        }
    }

    let ThingDidChangeNotification = "MyThingDidChangeNotification"

    override func viewDidLoad() {
        //[super viewDidLoad];
        //[self.navigationController setNavigationBarHidden:NO animated:YES];
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "thingDidChange:", name: ThingDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var userCounter = 0
    func insertNewObject(sender: AnyObject) {
        var userName = "name\(++userCounter)"
        var userCounter_s = String(userCounter)
        let newUser = User(name: userName, phone: userCounter_s, altPhone: userCounter_s, email: "\(userName)@gmail.com")
        users.insert(newUser, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let user = users[indexPath.row] as User
                let controller = (segue.destinationViewController as! DetailViewController)
                controller.detailItem = user
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let user = users[indexPath.row] as User
        cell.textLabel!.text = user.name
        cell.detailTextLabel?.text = user.phone
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            users.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

