//
//  SecondViewController.swift
//  catacomb2018
//
//  Created by xyu on 09/05/2018.
//  Copyright © 2018 xyu. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var news: [News]!
    var currentInex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName:"NewTableViewCell", bundle: nil)
        self.tableView!.register(nib, forCellReuseIdentifier: "cell")
        
        tableView.reloadData()
        self.tableView!.backgroundView = UIImageView(image: UIImage(named: "bg_sea.png"))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        news = News().getList()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (news != nil) ? news.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewTableViewCell
        let current = news[indexPath.row]
        cell?.news = current
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentInex = indexPath.row
        performSegue(withIdentifier: "go2NewsDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "go2NewsDetail" {
                let tmp = segue.destination as! NewsDetailViewController
                tmp.news = news[currentInex]
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
