//
//  AttractionTableViewController.swift
//  TableViewStory
//
//  Created by HanGyo Jeong on 07/04/2019.
//  Copyright © 2019 HanGyoJeong. All rights reserved.
//

import Foundation
import UIKit

class AttractionTableViewController: UITableViewController{
    var attractionImages = [String]()
    var attractionNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attractionNames = ["Spring Man's Fashion01",
        "Spring Man's Fashion02",
        "Spring Man's Fashion03",
        "Spring Man's Fashion04",
        "Spring Man's Fashion05"]
        
        attractionImages = ["cody1", "cody2", "cody3", "cody4", "cody5"]
        
        tableView.estimatedRowHeight = 50
    }
    
    //MARK: Table view data source
    
    //Return Section's number
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Return Row's Number
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionNames.count
    }
    
    //테이블 뷰 컨트롤러가 표시할 새로운 셀을 필요로 할 때마다 이 메서드를 호출
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AttractionTableCell", for: indexPath) as! AttractionTableViewCell
        
        let row = indexPath.row
        cell.attractionLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        cell.attractionLabel.text = attractionNames[row]
        cell.attractionImage.image = UIImage(named: attractionImages[row])
        
        return cell
    }
}
