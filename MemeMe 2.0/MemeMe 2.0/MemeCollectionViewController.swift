//
//  MemeCollectionViewController.swift
//  MemeMe 2.0
//
//  Created by Vijaya Madhavi on 19/10/17.
//  Copyright © 2017 Vijaya Madhavi. All rights reserved.
//

import UIKit

// Class

class MemeCollectionViewController: UICollectionViewController {

    var memes: [Meme]!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        //let dimensionH = (view.frame.size.height - (3 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView!.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = memes[(indexPath as NSIndexPath).row]
        cell.memeImageView?.image = meme.memedImage
        cell.memeImageView.contentMode = .scaleAspectFit
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.meme = memes[(indexPath as NSIndexPath).row]
        self.navigationController?.pushViewController(detailController, animated: true)
    }

    // MARK: To create a new Meme
    @IBAction func createNewMeme(_ sender: UIBarButtonItem) {
        let createNewMemeController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
        self.present(createNewMemeController!, animated: true, completion: nil)
    }
}
