//  FilmDetailsViewController.swift
//  GET People

import UIKit

class FilmDetailsViewController: UIViewController {

        var filmTitle = ""
        var releaseDate = ""
        var director = ""
        var openingCrawl = ""
    
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var releaseDateLabel: UILabel!
        @IBOutlet weak var directorLabel: UILabel!
        @IBOutlet weak var openingCrawlLabel: UILabel!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            titleLabel.text = filmTitle
            releaseDateLabel.text = releaseDate
            directorLabel.text = director
            openingCrawlLabel.text = openingCrawl
        }

}
