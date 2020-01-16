//
//  ReviewViewController.swift
//  PetPark
//
//  Created by macbook on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class CafeReviewViewController: UIViewController {
    
    private let headerView = CafeReviewHeaderView()
    private let cafeReviewTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnchor()
        setupUI()
    }
    private func setupUI() {
        cafeReviewTableView.register(CafeReViewTableViewCell.self, forCellReuseIdentifier: CafeReViewTableViewCell.identifier)
        cafeReviewTableView.dataSource = self
        cafeReviewTableView.rowHeight = 120
    }
    
    private let margin: CGFloat = 10
    private func setupAnchor() {
        [headerView, cafeReviewTableView].forEach {
            view.addSubview($0)
        }
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: margin * 12)
        ])
        cafeReviewTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeReviewTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            cafeReviewTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cafeReviewTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cafeReviewTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension CafeReviewViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        menuData.count
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cafeData[0].cafes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CafeReViewTableViewCell.identifier, for: indexPath) as! CafeReViewTableViewCell
        
        let cafe =  cafeData[0].cafes[indexPath.row]
        
        cell.cafeReviewInfo(ID: cafe.name, roundImage: cafe.imageName, CafeDate: "2020년 1월 15일", CafeReView: "인생이 힘들어요")
        return cell
    }
    
    
}
