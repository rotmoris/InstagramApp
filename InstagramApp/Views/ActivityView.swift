//
//  ActivityView.swift
//  InstagramApp
//
//  Created by Peter Orisadipe on 02/06/2019.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class ActivityView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var activityData: [Activity] = [Activity]() {
        
        didSet {
            
            tableView.reloadData()
            
        }
        
    }
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
        tableView.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityTableViewCell")
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return activityData.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var x = "me"
        x = x + "me"
        
        return CGFloat(80.0)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTableViewCell") as! ActivityTableViewCell
        
        cell.profileImage.image = activityData[indexPath.row].userImage
        
        cell.detailsLabel.text = activityData[indexPath.row].details
        
        return cell
        
    }
    
}
