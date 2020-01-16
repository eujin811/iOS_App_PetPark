//
//  PensionDetailViewController.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/17.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
import MapKit

class PensionDetailViewController: UIViewController {

    private var selectedIndexPath: IndexPath!
        
        private let phoneImage = UIImageView()
        private let siteImage = UIImageView()
        private let mapImage = UIImageView()
        
        private let scrollView = UIScrollView()
        private let pensionImage = UIImageView()
        private let pensionNameLabel = UILabel()
        private let pensionSite = UILabel()
        private let pensionNum = UILabel()
        private let pensionAddress = UILabel()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            title = "펜션 상세화면"
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(didTabBackButton(_:)))
            
            attribute()
            setUpUI()
        }
        
        private func setUpUI() {
            
            let margin:CGFloat = 30
            let padding:CGFloat = 15
            let viewWidth = view.frame.width
            let miniImageLine:CGFloat = 20
            let miniImageMargin:CGFloat = margin + 5
            
            
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
            pensionImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
                pensionImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
                pensionImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor
                    , constant: -margin),
                pensionImage.heightAnchor.constraint(equalToConstant: viewWidth - (margin * 2 + viewWidth / 4))
                
            ])
            
            pensionNameLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionNameLabel.topAnchor.constraint(equalTo: pensionImage.bottomAnchor, constant: padding),
                pensionNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin + padding),
                pensionNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
            ])
            
            phoneImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                phoneImage.heightAnchor.constraint(equalToConstant: miniImageLine),
                phoneImage.widthAnchor.constraint(equalToConstant: miniImageLine),
                phoneImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: miniImageMargin),
                phoneImage.topAnchor.constraint(equalTo: pensionNameLabel.bottomAnchor, constant: margin)
            ])
            
            pensionNum.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionNum.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: padding),
                pensionNum.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
                pensionNum.centerYAnchor.constraint(equalTo: phoneImage.centerYAnchor)
            ])
            
            siteImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                siteImage.heightAnchor.constraint(equalToConstant: miniImageLine),
                siteImage.widthAnchor.constraint(equalToConstant: miniImageLine),
                siteImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: miniImageMargin),
                siteImage.topAnchor.constraint(equalTo: phoneImage.bottomAnchor, constant: padding)
            ])
            
            pensionSite.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionSite.leadingAnchor.constraint(equalTo: siteImage.trailingAnchor, constant: padding),
                pensionSite.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
                pensionSite.centerYAnchor.constraint(equalTo: siteImage.centerYAnchor)
            ])
            
            mapImage.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                mapImage.heightAnchor.constraint(equalToConstant: miniImageLine),
                mapImage.widthAnchor.constraint(equalToConstant: miniImageLine),
                mapImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: miniImageMargin),
                mapImage.topAnchor.constraint(equalTo: siteImage.bottomAnchor, constant: padding)
            ])
            
            pensionAddress.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                pensionAddress.centerYAnchor.constraint(equalTo: mapImage.centerYAnchor),
                pensionAddress.leadingAnchor.constraint(equalTo: mapImage.trailingAnchor, constant: padding),
                pensionAddress.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
            ])
        }
        
        private func attribute() {
            
            /*
             pensionName.font = .boldSystemFont(ofSize: 18)
             pensionAddress.font = .italicSystemFont(ofSize: 13)
             */
            
            // MARK: - UISetData
            phoneImage.image = UIImage(systemName: "phone.fill")
            phoneImage.tintColor = .gray
            siteImage.image = UIImage(systemName: "house.fill")
            siteImage.tintColor = .gray
            mapImage.image = UIImage(systemName: "map.fill")

            mapImage.tintColor = .gray
            
            
            pensionImage.image = UIImage(named: "pension1")
            
            
            pensionNameLabel.font = .boldSystemFont(ofSize: 23)
            pensionNameLabel.textAlignment = .center
            
            
            pensionNameLabel.text = "사랑가득 펜션"
            
            pensionAddress.textColor = .gray
            pensionAddress.text = "서울시 서초구 신반포로 32"
            
            pensionSite.textColor = .darkGray
            pensionSite.text = "https://github.com/eujin811"
            
            pensionNum.text = "02 - 000 - 0000"
            pensionNum.textColor = .darkGray
            
            view.addSubview(scrollView)
            view.addSubview(phoneImage)
            view.addSubview(pensionImage)
            view.addSubview(pensionNameLabel)
            view.addSubview(pensionSite)
            view.addSubview(pensionNum)
            view.addSubview(pensionAddress)
            view.addSubview(siteImage)
            view.addSubview(mapImage)
    //        scrollView.backgroundColor = .green
            
        }
        
       

        @objc private func didTabBackButton(_ sender: Any) {
    //        dismiss(animated: true)
            print("didTabBackButton")
            dismiss(animated: true)
        }
}
