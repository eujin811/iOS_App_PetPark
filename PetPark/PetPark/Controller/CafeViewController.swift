//
//  CafeViewController.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
import MapKit
class CafeViewController: UIViewController {
  let tempCollectionView: UICollectionView = {
    let tempCollectionViewLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: tempCollectionViewLayout)
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "PetPark"
    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchBar.delegate = self
    self.navigationItem.searchController = searchController
    attribute()
    setupUI()
  }
  override func viewWillAppear(_ animated: Bool) {
    
  }
  
  private func attribute() {
    tempCollectionView.backgroundColor = .white
    tempCollectionView.register(CheckCollectionViewCell.self, forCellWithReuseIdentifier: CheckCollectionViewCell.identifier)
    
    tempCollectionView.dataSource = self
    tempCollectionView.delegate = self
  }
  private func setupUI() {
    [tempCollectionView].forEach {
      self.view.addSubview($0)
    }
    tempCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tempCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
      tempCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tempCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tempCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
  
}


extension CafeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cafeData[section].cafes.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CheckCollectionViewCell.identifier, for: indexPath) as! CheckCollectionViewCell
    let cafe = cafeData[indexPath.section].cafes[indexPath.row]
    cell.cafeInfo(cafeName: cafe.name, cafeLocation: cafe.location, cafeImageName: cafe.imageName)
    return cell
  }
}



extension CafeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width / 2 - 10
      , height: 270)
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let margin: CGFloat = 5
    return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cafeDetailVC = UINavigationController(rootViewController: CafeDetailViewController())
    
    cafeDetailVC.modalPresentationStyle = .fullScreen
    present(cafeDetailVC, animated: true)
  }
}



extension CafeViewController: UICollectionViewDelegate {
  
}


extension CafeViewController: UISearchBarDelegate{
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let searchText = searchBar.text else { return }
    print(searchText)
  }
}
