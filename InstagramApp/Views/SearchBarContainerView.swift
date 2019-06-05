//
//  SearchBarContainerView.swift
//  InstagramApp
//
//  Created by Peter Orisadipe on 19/05/2019.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class SearchBarContainerView: UIView {

    var searchBar: UISearchBar = UISearchBar()
    
    init(customSearchBar: UISearchBar) {
        
        self.searchBar = customSearchBar
        
        super.init(frame: CGRect.zero)
        
        addSubview(searchBar)
    }
    
    convenience override init(frame: CGRect) {
        self.init(customSearchBar: UISearchBar())
        self.frame = frame
    }
    
    override func layoutSubviews() {
        searchBar.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
