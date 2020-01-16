//
//  CheckCollectionViewCell.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class CheckCollectionViewCell: UICollectionViewCell {
  private let cafeImageView = UIImageView()
  private let cafeNameLabel = UILabel()
  private let cafeLocationLabel = UILabel()
  
  static let identifier = "CheckCell"
  override init(frame: CGRect) {
    super.init(frame: frame)
//    self.backgroundColor = .green
    setupUI()
    
  }
  
  func cafeInfo(cafeName: String, cafeLocation: String, cafeImageName: String){
    cafeImageView.image = UIImage(named: cafeImageName)
    
    cafeNameLabel.text = cafeName
    cafeLocationLabel.text =  cafeLocation
  }
  
  
  private func setupUI() {
    [cafeImageView, cafeNameLabel, cafeLocationLabel].forEach {
        contentView.addSubview($0)
    }
    
    cafeImageView.layer.cornerRadius = 10
    cafeImageView.layer.masksToBounds = true
    cafeLocationLabel.textColor = .gray
    let margin: CGFloat = 5
    
    cafeImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        cafeImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
        cafeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        cafeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//        cafeImageView.widthAnchor.constraint(equalToConstant: margin * 10),
        cafeImageView.heightAnchor.constraint(equalToConstant: margin * 40),
    ])
    
    cafeNameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        cafeNameLabel.topAnchor.constraint(equalTo: cafeImageView.bottomAnchor, constant: margin),
        cafeNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
//        cafeNameLabel.widthAnchor.constraint(equalToConstant: margin * 10),
        cafeNameLabel.heightAnchor.constraint(equalToConstant: margin * 4),
    ])
    
    cafeLocationLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        cafeLocationLabel.topAnchor.constraint(equalTo: cafeNameLabel.bottomAnchor, constant: margin),
        cafeLocationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
//        cafeLocationLabel.widthAnchor.constraint(equalToConstant: margin * 5),
        cafeLocationLabel.heightAnchor.constraint(equalToConstant: margin * 4),
    ])
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
