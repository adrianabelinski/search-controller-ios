//
//  CountryCell.swift
//  SearchController
//
//  Created by Zac Workman on 29/01/2019.
//  Copyright © 2019 Kwip Limited. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    let titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let categoryLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lbl.textAlignment = .right
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLbl)
        addSubview(categoryLbl)
        
        titleLbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: categoryLbl.leftAnchor).isActive = true
        titleLbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        categoryLbl.topAnchor.constraint(equalTo: topAnchor).isActive = true
        categoryLbl.widthAnchor.constraint(equalToConstant: 120).isActive = true
        categoryLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        categoryLbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
