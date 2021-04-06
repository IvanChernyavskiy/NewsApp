//
//  Model.swift
//  NewsApp
//
//  Created by Иван Чернявский on 18.03.2021.
//

import Foundation

var articles: [Article] {
    
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return []
    }
    
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDictionaryAny == nil {
        return []
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String,  Any>
    if rootDictionary == nil {
        return []
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>] {
        var returnArray: [Article] = []
        
        for dict in array {
        let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        return returnArray
    }
    
    return []
}
var urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

func loadNews(complitionHandler: (()-> Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-03-17&to=2021-03-17&sortBy=popularity&apiKey=57be93f378ee4144bc061e848a5a910c")
   
    let session = URLSession(configuration: .default)
    
    let downloadTASK = session.downloadTask(with: url!) { (urlFile, responce, error) in
        if urlFile != nil {
    
           try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
           
            
           
            complitionHandler?()
            
            
            
        }
    }
    
    downloadTASK.resume()
   
}


