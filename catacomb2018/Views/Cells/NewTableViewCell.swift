//
//  NewTableViewCell.swift
//  catacomb2018
//
//  Created by xyu on 17/05/2018.
//  Copyright © 2018 xyu. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var labNews: UILabel!
    
    var news: News?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        self.labNews.text = news?.title
        
        self.imgNews.contentMode = UIViewContentMode.scaleAspectFit
        self.imgNews.image = UIImage(named: (news?.image)!)
        
        //        (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: URL(string: (news?.url)!)!, completionHandler: { (imageData, response, error) in
        //            if let data = imageData {
        //                DispatchQueue.main.async {
        //                    self.imgNews.image = UIImage(data: data)
        //                }
        //            }
        //        }).resume()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
