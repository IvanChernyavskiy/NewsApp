//
//  Article.swift
//  NewsApp
//
//  Created by Иван Чернявский on 18.03.2021.
//

import Foundation

/*

-"source": {
"id": "engadget",
"name": "Engadget"
},
"author": "https://www.engadget.com/about/editors/saqib-shah",
"title": "Utah considers bill that would install anti-porn filters on new phones",
"description": "Utah's Republican governor has until March 25th to veto or sign a bill requiring phones and tablets sold in the state to automatically block pornography.",
"url": "https://www.engadget.com/utah-bill-anti-porn-filter-phones-105518636.html",
"urlToImage": "https://s.yimg.com/os/creatr-uploaded-images/2021-03/4c076d70-870a-11eb-bb7f-7a455e332d0f",
"publishedAt": "2021-03-17T10:55:18Z",

*/

struct Article {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedArt: String
    var sourceName: String
    init(dictionary: Dictionary<String, Any>) {
    author = dictionary["author"] as? String ?? ""
    title = dictionary["title"] as? String ?? ""
    description = dictionary["description"] as? String ?? ""
    url = dictionary["url"] as? String ?? ""
    urlToImage = dictionary["urlToImage"] as? String ?? ""
    publishedArt = dictionary["publishedArt"] as? String ?? ""
    sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["":""])["name"] as? String ?? ""
     
    }
}
