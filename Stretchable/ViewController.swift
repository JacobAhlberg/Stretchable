//
//  ViewController.swift
//  Stretchable
//
//  Created by Jacob Ahlberg on 2018-10-19.
//  Copyright © 2018 Jacob Ahlberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var items: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50
        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for i in 0..<50 {
            items.append(i)
        }
        tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(items[indexPath.row])"
        cell.textLabel?.textColor = .white
        
        switch indexPath.row % 2 {
        case 0: cell.backgroundColor = .darkGray
        default: cell.backgroundColor = .black
        }
        
        return cell
    }
    
    
}

extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 500)
        imageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: UIScreen.main.bounds.width, height: height)
    }
    
}
