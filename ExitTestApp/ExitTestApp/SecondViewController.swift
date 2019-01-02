//
//  SecondViewCVontrollerViewController.swift
//  ExitTestApp
//
//  Created by Kirankumar Bollem on 12/28/18.
//  Copyright © 2018 Kirankumar Bollem. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  final  let urlString =  "http://webhose.io/filterWebContent?token=4c0d684c-28a4-4271-8cd1-c8b97e9e6d96&format=json&sort=crawled&q=english"

    @IBOutlet weak var jsonTableView: UITableView!
    var countryArray = [String]()
    var section_titleArray = [String]()
    var titlelArray = [String]()
    var siteArray = [String]()
    var main_imageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
    }
    
    func downloadJsonWithURL(){
        let url = NSURL(string: urlString)
            URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error)
                -> Void in
       
            if let JsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)as? NSDictionary {
                print(JsonObj!.value(forKey: "posts") as Any)
                
               if let postArray = JsonObj!.value(forKey: "posts") as? NSArray {
                    for post in postArray{
                        if let postDict = post as? NSDictionary {
                            if let country = postDict.value(forKey: "country"){
                                self.countryArray.append(country as! String)
                            }
                            if let country = postDict.value(forKey: "section_title"){
                                self.section_titleArray.append(country as! String)
                            }
                            if let country = postDict.value(forKey: "title"){
                                self.titlelArray.append(country as!String)
                            }
                            if let country = postDict.value(forKey: "site"){
                                self.siteArray.append(country as! String)
                            }
                            if let country = postDict.value(forKey: "main_image"){
                                self.main_imageArray.append(country as! String)
                            }
                            
                            OperationQueue.main.addOperation({
                                self.jsonTableView.reloadData()
                            })
                        }
                        
                    }
                
                }
            }
        
    }).resume()
}
    
    func downloadJsonWithTask() {
        let url = NSURL(string: urlString)
        var downloadTask = URLRequest(url: (url as URL?)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            print(jsonData as Any)
        
        }).resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jCell") as!JsonTableViewCell
       
        cell.countryLabel.text = countryArray[indexPath.row]
        cell.sectionLabel.text = section_titleArray[indexPath.row]
        cell.titleLabel.text = titlelArray[indexPath.row]
        cell.rankLabel.text = siteArray[indexPath.row]
        
        let main_image = NSURL(string: main_imageArray[indexPath.row])
        if main_image != nil {
            let data = NSData(contentsOf:(main_image as URL?)!)
            cell.imgUrl.image = UIImage(data: data! as Data)
        }
         return cell
    }

}
