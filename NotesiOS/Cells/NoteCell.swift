//
//  NoteCell.swift
//  NotesiOS
//
//  Created by Nabil Rahman on 10/24/19.
//  Copyright © 2019 Nabil Rahman. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    var noteData: Note! {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy"
            noteLabel.text = noteData.title
            dateLabel.text = dateFormatter.string(from: noteData.date ?? Date())
            previewLabel.text = noteData.text
        }
    }
    
    fileprivate var noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Places to take photos"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    fileprivate var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "1/12/2011"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .gray
        return label
    }()
    
    fileprivate var previewLabel: UILabel = {
        let label = UILabel()
        label.text = "The note text will go here to create a preview."
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = UIColor.gray.withAlphaComponent(0.8)
        return label
    }()
    
    fileprivate lazy var horizontalStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [dateLabel, previewLabel, UIView()])
        s.axis = .horizontal
        s.spacing = 10
        s.alignment = .leading
        return s
    }()
    
    fileprivate lazy var verticalStackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [noteLabel, horizontalStackView])
        s.axis = .vertical
        s.spacing = 4
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(verticalStackView)
        verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
