//
//  TVC.swift
//  clima
//
//  Created by Wilman Garcia De Leon on 1/1/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class TVC: UITableViewController {

    private var  Ciudades : Array<Array<String>> = Array<Array<String>>()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Clima de Ciudades"

        Ciudades.append(["CARACAS", "VEXX0008"])
        Ciudades.append(["PARIS", "FRXX0076"])
        Ciudades.append(["GUATEMALA CITY",    "GTXX0002"])
//        Ciudades.append(["ANTIGUA GUATEMALA", "GTXX0020"])
//        Ciudades.append(["TECPAN GUATEMALA",  "GTXX0947"])
//        Ciudades.append(["QUETZALTENANGO",    "GTXX0005"])

        
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.Ciudades.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = self.Ciudades[indexPath.row][0]

        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let cc = segue.destinationViewController as! controllerCiudad
        let ip = self.tableView.indexPathForSelectedRow
        cc.codigo = self.Ciudades[ip!.row][1]
        
    }


}
