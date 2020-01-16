//
//  PensionTableViewCell.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

protocol MyPagePensionTableViewCellDelegate: class {
    func selectItem(indexPath: IndexPath)
}

class MyPagePensionTableViewCell: UITableViewCell {
    
    weak var delegate: MyPagePensionTableViewCellDelegate?
    
    private let pensionTempCollectionView: UICollectionView = {
            let pensionCollectionViewFlowLayout = UICollectionViewFlowLayout()
          pensionCollectionViewFlowLayout.scrollDirection = .horizontal
        let pensionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: pensionCollectionViewFlowLayout)
        return pensionCollectionView
    }()
    private let pensionLabel = UILabel()
    static let identifier = "PensionTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupAnchor()
    }
    private func setupUI() {
        pensionTempCollectionView.backgroundColor = .white

        pensionLabel.text = "     펜션"
        pensionLabel.font = .systemFont(ofSize: 25, weight: .bold)
        pensionTempCollectionView.register(MyPagePensionCollectionViewCell.self, forCellWithReuseIdentifier: MyPagePensionCollectionViewCell.identifier)
        pensionTempCollectionView.dataSource = self
        pensionTempCollectionView.delegate = self
        
    }
    private func setupAnchor() {
        [pensionTempCollectionView, pensionLabel].forEach {
            self.contentView.addSubview($0)
        }
        pensionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pensionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            pensionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pensionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pensionLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        pensionTempCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pensionTempCollectionView.topAnchor.constraint(equalTo: pensionLabel.bottomAnchor),
            pensionTempCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pensionTempCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pensionTempCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MyPagePensionTableViewCell: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        menuData.count
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cafeData[0].cafes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPagePensionCollectionViewCell.identifier, for: indexPath) as! MyPagePensionCollectionViewCell
        
        cell.pensionInfo(pensionImage: cafeData[0].cafes[indexPath.row].imageName, pensionName: cafeData[0].cafes[indexPath.row].name, pensionRegion: cafeData[0].cafes[indexPath.row].location)
        
    
        
        return cell
    }
}
extension MyPagePensionTableViewCell: UICollectionViewDelegateFlowLayout {
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

extension MyPagePensionTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.selectItem(indexPath: indexPath)

    }
}
