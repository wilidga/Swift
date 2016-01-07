//
//  LibrosViewController.swift
//  BuscarLibrosOpenLibrary
//
//  Created by Wilman Garcia De Leon on 1/4/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit


class LibrosViewController: UITableViewController {

     var players:[Player] = playersData
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tableView!.reloadData()
//        
//            print(playersData)
        
        print("viewWillAppear was just called")
        super.viewWillAppear(true)
        players = playersData
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.tableView!.reloadData()
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
        // #warning Incomplete implementation, return the number of rows
        
        let player = players[0] as Player
        var struckCount : Int = 0
        if players.count == 1 {
      
        if player.titulo == ""{
            struckCount = 0
        }else{
            struckCount = players.count
        }
        }else{
            struckCount = players.count
        }
        
        return struckCount //players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Configure the cell...
        let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
        
        let player = players[indexPath.row] as Player
       
         if player.titulo != ""{
            cell.textLabel?.text = player.titulo
            cell.detailTextLabel?.text = player.isbn
        }
         print("viewWillAppear was just called write")

        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
     if segue.identifier == "showDetail" {
        let svc = segue.destinationViewController as! DetailControlerRow;
//          var isbn : String = ""
        
                    
        
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    var isbn : String = ""
                    let player = players[indexPath.row] as Player
                        isbn = player.isbn!
                        svc.toPassISBN = isbn
                            }

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
