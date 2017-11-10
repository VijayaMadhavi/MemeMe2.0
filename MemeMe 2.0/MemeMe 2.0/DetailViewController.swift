//
//  DetailViewController.swift
//  MemeMe 2.0
//
//  Created by Vijaya Madhavi on 22/10/17.
//  Copyright © 2017 Vijaya Madhavi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var memeImageView: UIImageView!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.memeImageView!.image = self.meme.memedImage
        memeImageView.contentMode = .scaleAspectFit
    }

}
