//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Иван Чернявский on 23.03.2021.
//

import UIKit

class OneNewsViewController: UIViewController {

    var article: Article!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    
    
    @IBAction func pushOpenAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = article.title
        labelDescription.text = article.description
        
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
