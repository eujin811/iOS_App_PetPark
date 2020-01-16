//
//  LikeTableViewCell.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
protocol MyPageTableViewCellDelegate: class {
    func whenPickImageButtonDidTap()
}
class MyPageTableViewCell: UITableViewCell {
    
    weak var delegate: MyPageTableViewCellDelegate?
    
    private let photoView = UIView()
    private let nickNameLabel = UILabel()
    private let photoImageView = UIImageView()
    private let plusButton = UIButton()
    static let identifier = "LikeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupAnchor()
    }

    @objc private func pickImage() {
        delegate?.whenPickImageButtonDidTap()
    }
    
    func tableViewInfo(photoImage: String, nickName: String) {
        nickNameLabel.text = nickName
        photoImageView.image = UIImage(named: photoImage)
    }
    
    func setUserImage(_ image: UIImage) {
        photoImageView.image = image
    }
    
    private func setupUI() {
        photoView.layer.cornerRadius = margin * 12 / 2
        photoImageView.layer.cornerRadius = margin * 12 / 2
        photoImageView.layer.masksToBounds = true
        
        plusButton.layer.cornerRadius = margin * 2 / 2
        plusButton.backgroundColor = .white
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.setTitle("+", for: .normal)
        plusButton.layer.borderWidth = 0.1
        plusButton.layer.borderColor = UIColor.black.cgColor
        plusButton.addTarget(self, action: #selector(pickImage), for: .touchUpInside)
        nickNameLabel.text = "닉네임"
        nickNameLabel.font = .systemFont(ofSize: 22)
        nickNameLabel.textColor = .black
    }
    let margin: CGFloat = 10
    private func setupAnchor() {
        [nickNameLabel, photoView].forEach {
            self.addSubview($0)
        }
        
        [photoImageView, plusButton].forEach {
            photoView.addSubview($0)
        }
        photoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            photoView.topAnchor.constraint(equalTo: self.topAnchor,constant: self.frame.height/3),
            photoView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: margin * 5),
            photoView.heightAnchor.constraint(equalToConstant: margin * 12),
            photoView.widthAnchor.constraint(equalToConstant: margin * 12),
        ])
        
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nickNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 5),
            nickNameLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: margin * 5),
            nickNameLabel.widthAnchor.constraint(equalToConstant: margin * 20),
            nickNameLabel.heightAnchor.constraint(equalToConstant: margin * 5),
        ])
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: photoView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: photoView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: photoView.bottomAnchor),
        ])
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.trailingAnchor.constraint(equalTo: photoView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: photoView.bottomAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: margin * 2),
            plusButton.heightAnchor.constraint(equalToConstant: margin * 2),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
