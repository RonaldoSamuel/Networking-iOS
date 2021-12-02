//
//  ListViewCell.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    static let identifier = "ListViewCell"
            
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblDate: UILabel = {
       var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var lblDescription: UILabel = {
       var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubViews()
    }
    
    func createSubViews() {
               
        setupTitle()
    }
    
    func setupTitle() {
        
        contentView.addSubview(lblTitle)
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: size.height * 0.015),
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.025)
        ])
        
        contentView.addSubview(lblDate)
        NSLayoutConstraint.activate([
            lblDate.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 10),
            lblDate.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblDate.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor)
        ])
        
        contentView.addSubview(lblDescription)
        NSLayoutConstraint.activate([
            lblDescription.topAnchor.constraint(equalTo: lblDate.bottomAnchor, constant: 10),
            lblDescription.leadingAnchor.constraint(equalTo: lblDate.leadingAnchor),
            lblDescription.trailingAnchor.constraint(equalTo: lblDate.trailingAnchor),
            lblDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configCell(_ data: ListModelElement) {
        lblTitle.text = data.categoryId
        lblTitle.textColor = .black
// lblDate.text = data.name
        lblDescription.text = data.name
    }
}
