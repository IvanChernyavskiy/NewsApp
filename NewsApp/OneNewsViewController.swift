//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Иван Чернявский on 23.03.2021.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {
    var index: Int = 0
    var article: Article!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    
    @IBAction func pushOpenAction(_ sender: Any) {
        if let url =  URL(string: article.url) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = article.title
        labelDescription.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
                
                
            }
        }
        
//        if URL(string: article.url) == nil {
//            // скрываем кнопку
//            
//        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
