//
//  PensionCollectionViewCell.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/17.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class PensionCollectionViewCell: UICollectionViewCell {
    private let pensionImageView = UIImageView()
        private let pensionName = UILabel()
        private let pensionAddress = UILabel()
        private let likeButton = UIButton()
        private let pensionIntroduce = UILabel()
        static let identifier = "PensionCollectionViewCell"
        static let likeTrue = "suit.heart.fill"
        static let likeFalse = "suit.heart"
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            attribute()
            setUpUI()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    func penseionItemSet(pensionImage image: String, pensionName name: String, pensionAddress address: String, likeButtonImage likeImage: String, pensionIndtroduce introduce: String) {
            pensionImageView.image = UIImage(named: image)
            pensionName.text = name
            pensionAddress.text = address
            likeButton.setImage(UIImage(named: likeImage), for: .normal)
            pensionIntroduce.text = introduce
        }
        private func attribute() {
    //        pensionImageView.layer.cornerRadius = 30
            pensionAddress.textColor = .gray
            pensionIntroduce.textColor = .darkGray
            
            pensionIntroduce.numberOfLines = 2
            
            pensionName.font = .boldSystemFont(ofSize: 18)
            pensionAddress.font = .italicSystemFont(ofSize: 13)
            pensionIntroduce.font = .systemFont(ofSize: 15, weight: .light)
        }
        
        private func setUpUI() {
            
            [pensionImageView, pensionName, pensionAddress, pensionIntroduce /*likeButton*/].forEach {
                contentView.addSubview($0)
            }

            
            let margin: CGFloat = 10
            let padding: CGFloat = 5
            let imageViewHeight: CGFloat = 150
            let labelHeight: CGFloat = 30
                pensionImageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                pensionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                pensionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                pensionImageView.heightAnchor.constraint(equalToConstant: imageViewHeight)
            ])
            
            pensionName.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionName.topAnchor.constraint(equalTo: pensionImageView.bottomAnchor, constant: margin),
                pensionName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
                pensionName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
                pensionName.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
            pensionAddress.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionAddress.topAnchor.constraint(equalTo: pensionName.bottomAnchor),
                pensionAddress.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
  
                pensionAddress.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(padding)),
//                pensionAddress.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
            
            pensionIntroduce.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionIntroduce.topAnchor.constraint(equalTo: pensionAddress.bottomAnchor),
                pensionIntroduce.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
                pensionIntroduce.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(padding * 2)),
                pensionIntroduce.heightAnchor.constraint(equalToConstant: labelHeight * 2)
            ])
    //        likeButton.translatesAutoresizingMaskIntoConstraints = false
    //        NSLayoutConstraint.activate([
    //            likeButton.topAnchor.constraint(equalTo: pensionImageView.topAnchor, constant: padding),
    //            likeButton.trailingAnchor.constraint(equalTo: pensionImageView.trailingAnchor, constant: -padding),
    //            likeButton.widthAnchor.constraint(equalToConstant: labelHeight),
    //            likeButton.heightAnchor.constraint(equalToConstant: labelHeight)
    //        ])
            
        }
        
        
}
