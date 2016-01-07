//
//  CVC.swift
//  ImagenesEjemplo
//
//  Created by Wilman Garcia De Leon on 1/3/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

struct Seccion {
    var nombre: String
    var imagenes: [UIImage]
    init( nombre : String , imagenes : [UIImage]){
        self.nombre = nombre
        self.imagenes = imagenes
    
    }
}

class CVC: UICollectionViewController {
    
    var imagenes = [Seccion]()
    
    
    
    @IBAction func buscar(sender: UITextField) {
        
        let seccion = Seccion(nombre: sender.text!, imagenes: BusquedaGoogle(sender.text!))
        imagenes.append(seccion)
//        print(BusquedaGoogle(sender.text!))
        
        self.collectionView!.reloadData()
        
        
        
    }
    
    func BusquedaGoogle(termino : String) -> [UIImage]{
        var imgs = [UIImage]()

        let urls = "https://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&q=" + termino
        let url = NSURL (string : urls)
        let datos = NSData (contentsOfURL: url!)
        
        do{
            let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves) as! NSDictionary
            let resultados = (json["responseData"] as! NSDictionary)["results"] as! NSArray
            
            for elemento in resultados{
                    let img_urls = (elemento as! NSDictionary) ["unescapedURL"] as! String
                    let img_url = NSURL (string: img_urls)
                    let img_datos = NSData (contentsOfURL: img_url!)
               
                if let imagen = UIImage(data: img_datos!){
                        imgs.append(imagen)
                    
                }
            
            }
            
            
            
        }catch{
        
        }
        
        
        
        
        
        return imgs
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return imagenes.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imagenes[section].imagenes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! imgCelda
    
        
        cell.imagen.image = imagenes[indexPath.section].imagenes[indexPath.item]
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
