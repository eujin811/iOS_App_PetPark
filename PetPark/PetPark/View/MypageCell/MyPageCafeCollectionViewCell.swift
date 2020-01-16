//
//  CafeCollectionViewCell.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class MyPageCafeCollectionViewCell: UICollectionViewCell {
    
    private let cafeImageView = UIImageView()
    private let cafeNamgeLabel = UILabel()
    static let identifier = "CafeCollectionViewCell"
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAnchor()
        setupUI()
    }
    func cafeInfo(cafeImage: String, cafeName: String) {
        cafeImageView.image = UIImage(named: cafeImage)
        cafeNamgeLabel.text = cafeName
    }
    
    private func setupUI() {
//        cafeNamgeLabel.text = "이름"
        cafeNamgeLabel.textColor = .white
        cafeNamgeLabel.font = .systemFont(ofSize: 16, weight: .bold)
//        cafeNamgeLabel.backgroundColor = .white
//        cafeImageView.backgroundColor = .blue
        cafeImageView.layer.cornerRadius = 10
        cafeImageView.layer.masksToBounds = true

    }
    let margin: CGFloat = 10
    private func setupAnchor() {
        
        [cafeImageView, cafeNamgeLabel].forEach {
            contentView.addSubview($0)
        }
        
        cafeImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cafeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cafeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cafeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        cafeNamgeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeNamgeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: contentView.frame.width / 10),
            cafeNamgeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(margin * 1)),
            cafeNamgeLabel.widthAnchor.constraint(equalToConstant: margin * 15),
            cafeNamgeLabel.heightAnchor.constraint(equalToConstant: margin * 2)
        ])

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
