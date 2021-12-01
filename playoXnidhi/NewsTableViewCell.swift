//
//  NewsTableViewCell.swift
//  playoXnidhi
//
//  Created by Nidhi Soni on 01/12/21.

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var seeFullNewsBtn: UIButton!

    @IBOutlet weak var viewCell: UIView!

    var urlForContent : String?
    var newsWeb = NewsWebViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        newsImage.layer.cornerRadius = 8
        seeFullNewsBtn.layer.cornerRadius = 6
        viewCell.layer.cornerRadius = 7
    }

    @IBAction func seeFullNews(_ sender: Any) {
      
        UserDefaults.standard.set(newsTitle.text, forKey: "title")
        UserDefaults.standard.set(urlForContent, forKey: "content")
    
    }
    

}

