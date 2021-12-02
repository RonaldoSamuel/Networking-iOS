//
//  View.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class ListView: UIView {
    
    var titleLabel: UILabel = {
       var lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "NetworkingTest"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var tableLista: UITableView = {
        var table = UITableView()
        table.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        table.backgroundColor = .white
        table.separatorColor = .gray
        table.tableFooterView = UIView()
        table.refreshControl = UIRefreshControl()
        table.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
        
    }

    
    func createSubviews() {
        
        backgroundColor = .white
        
        setupTableView()
    }
    
    func setupTableView() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: size.height * 0.05),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(tableLista)
        NSLayoutConstraint.activate([
            tableLista.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 15),
            tableLista.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableLista.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableLista.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
