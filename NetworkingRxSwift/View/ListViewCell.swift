//
//  ListViewCell.swift
//  NetworkingRxSwift
//
//  Created by Ronaldo Filho on 02/12/21.
//

import UIKit

class ListViewCell: UITableViewCell {
    
    static let identifier = "ListViewCell"
    var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
            
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .systemGray
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var arrowImage: UIImageView = {
    var imgView = UIImageView()
        imgView.image = UIImage(named: .arrow_down_icon)?.withRenderingMode(.alwaysTemplate)
        imgView.tintColor = .gray
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var lblDescription: UILabel = {
       var lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.isHidden = true
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
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -size.width * 0.30)
        ])
        
        contentView.addSubview(arrowImage)
        NSLayoutConstraint.activate([
            arrowImage.topAnchor.constraint(equalTo: lblTitle.topAnchor, constant: 0),
            arrowImage.leadingAnchor.constraint(equalTo: lblTitle.trailingAnchor, constant: size.width * 0.15),
            arrowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            arrowImage.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        contentView.addSubview(lblDescription)
        
        topConstraint = lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: -5)
        bottomConstraint = lblDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            topConstraint,
            lblDescription.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblDescription.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            bottomConstraint
        ])
    }
    
    func configCell(_ data: ListModelElement) {
        lblTitle.text = data.categoryId
        lblTitle.textColor = .black
        lblDescription.text = data.name
    }
    
    func userClickEffect() {
        UIView.animate(withDuration:0.2, animations: {
            self.arrowImage.transform = CGAffineTransform(rotationAngle: self.topConstraint.constant == -5 ? CGFloat(179 * .pi/180.0) : 0)
                })
        if topConstraint.constant == -5 {
            makeTableViewLarger()
        } else {
            makeTableViewSmaller()
        }
    }
    
    func makeTableViewLarger() {
        topConstraint.constant = 20
        bottomConstraint.constant = -10
        lblDescription.isHidden = false
    }
    
    func makeTableViewSmaller() {
        topConstraint.constant = -5
        bottomConstraint.constant = 0
        lblDescription.isHidden = true
    }
    
}
