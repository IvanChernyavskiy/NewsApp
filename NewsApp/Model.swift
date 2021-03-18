//
//  Model.swift
//  NewsApp
//
//  Created by Иван Чернявский on 18.03.2021.
//

import Foundation

var articles: [Article] = []

// 57be93f378ee4144bc061e848a5a910c
//

func loadNews() {
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-03-17&to=2021-03-17&sortBy=popularity&apiKey=57be93f378ee4144bc061e848a5a910c")
   
    let session = URLSession(configuration: .default)
    
    let downloadTASK = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
    
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    
    let urlPath = URL(fileURLWithPath: path)
            try? FileManager.default.copyItem(at: urlFile!, to: urlPath)
//            print(urlPath)
            
            parseNews()
            
            print(articles.count)
            
        }
    }
    
    downloadTASK.resume()
   
}

func parseNews() {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    
    let data = try? Data(contentsOf: urlPath)
    let rootDictionary = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, Any>
    let array = rootDictionary!["articles"] as! [Dictionary<String, Any>]
    
    var returnArray: [Article] = []
    
    for dict in array {
    let newArticle = Article(dictionary: dict)
        returnArray.append(newArticle)
    }
    articles = returnArray
}
