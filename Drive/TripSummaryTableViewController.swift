//
//  TripSummaryTableViewController.swift
//  Drive
//
//  Created by Andrew Ke on 12/23/15.
//  Copyright © 2015 Andrew. All rights reserved.
//

import UIKit
import CoreLocation

protocol ModalPresenterVC
{
    func didDismiss()
}

class TripSummaryTableViewController: UITableViewController {
    var info = ["Average Speed", "Time Elapsed", "Driver Rating", "Number of offenses"]
    var trip: Trip!
    var delegate: ModalPresenterVC?
    var notModal: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.hideBottomHairline()
        (presentingViewController as! UINavigationController).navigationBarHidden = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        if (notModal)
        {
            navigationController?.navigationItem.leftBarButtonItem?.title = "Back"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        cell.textLabel?.text = info[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.detailTextLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.backgroundColor = UIColor.clearColor()
        
        switch info[indexPath.row] {
        case "Time Elapsed":
            print(trip.timeLapsed)
            cell.detailTextLabel?.text = String(format: "%.1f minutes", trip.timeLapsed/60.0)
        case "Average Speed":
            cell.detailTextLabel?.text = String(format: "%.1f MPH", 2.2374 * trip.averageSpeed)
        case "Driver Rating":
            cell.detailTextLabel?.text = String(format: "%.1f out of 10", trip.driverRating)
        case "Number of offenses":
            cell.detailTextLabel?.text = String(format: "%d", trip.numberOfOffenses)
        default:
            break
        }
        return cell
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        if (!notModal)
        {
            if let delegate = delegate
            {
                delegate.didDismiss()
                presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
                (presentingViewController as! UINavigationController).navigationBarHidden = false
            }
        }else
        {
             navigationController?.dismissViewControllerAnimated(true, completion: nil)
        }
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
