//
//  CafeTableViewCell.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
protocol MyPageCafeTableViewCellDelegate: class {
    func selectedItem(indexPath: IndexPath)
}

class MyPageCafeTableViewCell: UITableViewCell {
    
    weak var delegate: MyPageCafeTableViewCellDelegate?
    
    private let cafeLabel = UILabel()
    private var cafetempCollectionView: UICollectionView = {
        let tempCollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        tempCollectionViewFlowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: tempCollectionViewFlowLayout)
        return collectionView
    }()
    static let identifier = "CafeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        test()
        setupAnchor()
        setupUI()
    }
    private func test() {
        self.backgroundColor = .red
        cafeLabel.backgroundColor = .yellow
    }
    private func setupUI() {
        cafeLabel.text = "     카페"
        cafeLabel.font = .systemFont(ofSize: 25, weight: .bold)
        
        cafetempCollectionView.register(MyPageCafeCollectionViewCell.self, forCellWithReuseIdentifier: MyPageCafeCollectionViewCell.identifier)
        cafetempCollectionView.dataSource = self
        cafetempCollectionView.delegate = self
        cafetempCollectionView.backgroundColor = .white
    }
    private let margin: CGFloat = 10
    private func setupAnchor() {
        [cafeLabel, cafetempCollectionView].forEach {
            contentView.addSubview($0)
        }
        cafeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cafeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cafeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cafeLabel.heightAnchor.constraint(equalToConstant: margin * 5)
        ])
        
        cafetempCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafetempCollectionView.topAnchor.constraint(equalTo: cafeLabel.bottomAnchor),
            cafetempCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cafetempCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cafetempCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MyPageCafeTableViewCell: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        menuData.count
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        menuData[section].products.count
        cafeData[0].cafes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageCafeCollectionViewCell.identifier, for: indexPath) as! MyPageCafeCollectionViewCell
        
        cell.cafeInfo(cafeImage: cafeData[0].cafes[indexPath.row].imageName
            , cafeName: cafeData[0].cafes[indexPath.row].name )
        return cell
    }
}
extension MyPageCafeTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 230, height: 230)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}

extension MyPageCafeTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedItem(indexPath: indexPath)
    }
}
