//
//  ViewController.swift
//  playoXnidhi
//
//  Created by Nidhi Soni on 01/12/21.

import UIKit
import Kingfisher
import SVProgressHUD

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var buzzBanner: UIView!
    
    var news = [Article]()
    var newsWebContent = NewsWebViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON()
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        SVProgressHUD.show(withStatus: "Hey, fresh news coming right up!!")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        SVProgressHUD.dismiss()
    }
    
    func downloadJSON() {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=4cf7331ecee44bef80b632fd4c1ba6b3") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            if error == nil {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data!)
                    SVProgressHUD.dismiss()
                    self.news = result.articles
                    
                }
                catch {
                    print("JSON Error")
                }
            }
            
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
            
        }.resume()
        
    }
    
//MARK:- Table View Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard news.count != nil else {
            return 20
        }
        return news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        if news.count == 0 {
            return cell
        }
        else {
            cell.authorName.text = self.news[indexPath.row].author
            cell.newsTitle.text = self.news[indexPath.row].title
            cell.newsDescription.text = self.news[indexPath.row].content ?? "Click the below button to see full news"
            cell.urlForContent = self.news[indexPath.row].url
            
            if self.news[indexPath.row].urlToImage != nil {
                let imageUrl = URL(string: self.news[indexPath.row].urlToImage!)
                cell.newsImage.kf.setImage(with: imageUrl)
                
                return cell
            }
            else {
                
                let resource: Resource? = nil
                cell.newsImage.kf.setImage(with: resource)
                cell.imageView!.image = UIImage(named: "noImage")
                return cell
            }
           
        }
    }
}
