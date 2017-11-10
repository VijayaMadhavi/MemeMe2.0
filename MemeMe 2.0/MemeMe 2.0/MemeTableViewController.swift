//
//  MemeTableViewController.swift
//  MemeMe 2.0
//
//  Created by Vijaya Madhavi on 19/10/17.
//  Copyright © 2017 Vijaya Madhavi. All rights reserved.
//

import UIKit

// Class

class MemeTableViewController: UITableViewController {

    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tableView!.reloadData()
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath) as! MemeTableViewCell
        let meme = memes[(indexPath as NSIndexPath).row]
        cell.memeImageView?.image = meme.memedImage
        cell.memeLabel?.text = "\(meme.topText) ... \(meme.bottomText)"
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController?.pushViewController(detailController, animated: true)
    }

    // MARK: Too create a new Meme
    
    @IBAction func createNewMeme(_ sender: UIBarButtonItem) {
        let createNewMemeController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
        self.present(createNewMemeController!, animated: true, completion: nil)
    }
}
