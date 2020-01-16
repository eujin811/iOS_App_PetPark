//
//  CafeReViewTableViewCell.swift
//  PetPark
//
//  Created by macbook on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class CafeReViewTableViewCell: UITableViewCell {
    
    static let identifier = "CafeReViewTableViewCell"
    private let roundImageView = UIImageView()
    private let idLabel = UILabel()
    private let cafeReviewDateLabel = UILabel()
    private let cafeReviewLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupAnchor()
    }
    func cafeReviewInfo(ID: String, roundImage: String, CafeDate: String, CafeReView: String) {
        idLabel.text = ID
        roundImageView.image = UIImage(named: roundImage)
        cafeReviewDateLabel.text = CafeDate
        cafeReviewLabel.text = CafeReView
    }
    private let margin: CGFloat = 10
    private func setupUI() {
        [roundImageView, idLabel, cafeReviewDateLabel, cafeReviewLabel].forEach {
            contentView.addSubview($0)
        }
        
        roundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            roundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin * 3),
            roundImageView.widthAnchor.constraint(equalToConstant: margin * 4),
            roundImageView.heightAnchor.constraint(equalToConstant: margin * 6),
        ])
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            idLabel.leadingAnchor.constraint(equalTo: roundImageView.trailingAnchor, constant: margin * 1),
            idLabel.widthAnchor.constraint(equalToConstant: margin * 20),
            idLabel.heightAnchor.constraint(equalToConstant: margin * 3),
        ])
        cafeReviewDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeReviewDateLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            cafeReviewDateLabel.leadingAnchor.constraint(equalTo: roundImageView.trailingAnchor, constant: margin * 1),
            cafeReviewDateLabel.widthAnchor.constraint(equalToConstant: margin * 20),
            cafeReviewDateLabel.heightAnchor.constraint(equalToConstant: margin * 3),
        ])
        
        cafeReviewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeReviewLabel.topAnchor.constraint(equalTo: cafeReviewDateLabel.bottomAnchor, constant: margin * 1),
            cafeReviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin * 4),
            cafeReviewLabel.widthAnchor.constraint(equalToConstant: margin * 15),
            cafeReviewLabel.heightAnchor.constraint(equalToConstant: margin * 1),
        ])
        
        
    }
    
    private func setupAnchor() {
      
        idLabel.text = "덕"
        cafeReviewDateLabel.text = "2019년 1월 15일"
        cafeReviewLabel.text = "좋네요"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
