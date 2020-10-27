//
//  SaunaCell.swift
//  MapApp
//
//  Created by Sousuke Ikemoto on 2020/10/27.
//
import UIKit
import Foundation

final class Cell: UITableViewCell {
    private let namelabel: UILabel = .init()
    private let detailalbel: UILabel = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }


    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
    
        contentView.addSubview(namelabel)
        contentView.addSubview(detailalbel)
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        detailalbel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            namelabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 23),
            namelabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            namelabel.widthAnchor.constraint(equalToConstant:63 ),
            namelabel.heightAnchor.constraint(equalToConstant: 21)
        ])
        NSLayoutConstraint.activate([
            detailalbel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            detailalbel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            detailalbel.widthAnchor.constraint(equalToConstant: 127),
            detailalbel.heightAnchor.constraint(equalToConstant: 21)
        
        
        ])
        namelabel.text = "ああああああ"
        detailalbel.text = "いいいいいいい"
        namelabel.textColor = .black
        namelabel.backgroundColor = .red
    }
    
    
}
