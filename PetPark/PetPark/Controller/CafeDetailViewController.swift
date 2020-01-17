//
//  CafeDetailViewController.swift
//  PetPark
//
//  Created by YoujinMac on 2020/01/17.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit
import MapKit

class CafeDetailViewController: UIViewController {
    
    // MARK: - inputData
    var selectedIndexPath: IndexPath!
    let cafeImageString = "cafe"
    let cafeNameString = "뭉냥 cafe"
    let cafeInstarString = ""
    let cafeOpenHourString = "오전 11시 ~ 오후 10"
    let cafeMenuString = " 아메리카노: 3000 \n 라떼: 3500 \n 카푸치노: 4000 \n 콜라: 2000 "
    let cafeAddressString = "서울특별시 성동구 성수동2가 아차산로9길 8"
    
    private let scrollView = UIScrollView()
    private let cafeImage = UIImageView()
    private let cafeNameLabel = UILabel()
    private let cafeInstarButton = UIButton()
    private let cafeOpenHourLabel = UILabel()
    private let cafeMenuLabel = UILabel()
    private let cafeAddressLabel = UILabel()
    
    //icon
    private let instarIcon = UIImageView()
    private let openIcon = UIImageView()
    private let menuIcon = UIImageView()
    private let addressIcon = UIImageView()
    
    //후기
    private let contentView = UIView()
    
    //지도
    private let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "펜션 상세화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(didTabBackButton(_:)))
        
        attribute()
        geocodeAddressString()
        setUpUI()
    }
    
    // MARK: UI
    private func setUpUI() {
        
        let margin:CGFloat = 30
        let padding:CGFloat = 15
        let viewWidth = view.frame.width
        let miniImageLine:CGFloat = 20
        let miniImageMargin:CGFloat = margin + 5
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        cafeImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
             cafeImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: margin),
             cafeImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: margin),
             cafeImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor
                 , constant: -margin),
             cafeImage.widthAnchor.constraint(equalToConstant: viewWidth - (margin * 2)),
             cafeImage.heightAnchor.constraint(equalToConstant: viewWidth - ((margin * 2) + (viewWidth / 4)))
             
        ])
        
        cafeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeNameLabel.topAnchor.constraint(equalTo: cafeImage.bottomAnchor, constant: padding),
            cafeNameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: margin + padding),
            cafeNameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -margin),
        ])
        
        
        instarIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            instarIcon.heightAnchor.constraint(equalToConstant: miniImageLine),
            instarIcon.widthAnchor.constraint(equalToConstant: miniImageLine - 3),
            instarIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: miniImageMargin),
            instarIcon.topAnchor.constraint(equalTo: cafeNameLabel.bottomAnchor, constant: margin)
        ])
        cafeInstarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeInstarButton.leadingAnchor.constraint(equalTo: instarIcon.trailingAnchor, constant: padding),
            cafeInstarButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -(margin + padding)),
            //pensionIntroduce.centerYAnchor.constraint(equalTo: introduceImage.centerYAnchor)
            cafeInstarButton.topAnchor.constraint(equalTo: instarIcon.topAnchor)
        ])
        
        openIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            openIcon.heightAnchor.constraint(equalToConstant: miniImageLine),
            openIcon.widthAnchor.constraint(equalToConstant: miniImageLine),
            openIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: miniImageMargin),
            openIcon.topAnchor.constraint(equalTo:instarIcon.bottomAnchor, constant: padding)
        ])
        cafeOpenHourLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeOpenHourLabel.leadingAnchor.constraint(equalTo: openIcon.trailingAnchor, constant: padding),
            cafeOpenHourLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -margin),
            cafeOpenHourLabel.topAnchor.constraint(equalTo: openIcon.topAnchor)
//            cafeOpenHourLabel.centerYAnchor.constraint(equalTo: siteImage.centerYAnchor)
        ])
        
        menuIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuIcon.heightAnchor.constraint(equalToConstant: miniImageLine),
            menuIcon.widthAnchor.constraint(equalToConstant: miniImageLine),
            menuIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: miniImageMargin),
            menuIcon.topAnchor.constraint(equalTo:cafeOpenHourLabel.bottomAnchor, constant: padding)
        ])
        
        cafeMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeMenuLabel.leadingAnchor.constraint(equalTo: menuIcon.trailingAnchor, constant: padding),
            cafeMenuLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -margin),
            cafeMenuLabel.topAnchor.constraint(equalTo: menuIcon.topAnchor)
        ])
        
        addressIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressIcon.heightAnchor.constraint(equalToConstant: miniImageLine),
            addressIcon.widthAnchor.constraint(equalToConstant: miniImageLine),
            addressIcon.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: miniImageMargin),
            addressIcon.topAnchor.constraint(equalTo: cafeMenuLabel.bottomAnchor, constant: margin)
        ])
        
        cafeAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cafeAddressLabel.centerYAnchor.constraint(equalTo: addressIcon.centerYAnchor),
            cafeAddressLabel.leadingAnchor.constraint(equalTo: addressIcon.trailingAnchor, constant: padding),
            cafeAddressLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -margin),
        ])
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: cafeAddressLabel.bottomAnchor, constant: padding),
            mapView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: margin + padding),
            mapView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -(margin + padding)),
            mapView.heightAnchor.constraint(equalToConstant: viewWidth * (2/5))
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: margin),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: margin),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -margin),
            contentView.heightAnchor.constraint(equalToConstant: viewWidth - (margin * 2 + viewWidth / 4)),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func attribute() {
        // MARK: - MapKit UI
        mapView.delegate = self
        
        
        // icon setImage
        instarIcon.image = UIImage(systemName: "paperplane")
        instarIcon.tintColor = .gray
        openIcon.image = UIImage(systemName: "clock.fill")
        openIcon.tintColor = .gray
        menuIcon.image = UIImage(systemName: "square.and.pencil")
        menuIcon.tintColor = .gray
        addressIcon.image = UIImage(systemName: "map.fill")
        addressIcon.tintColor = .gray
        
        // label, button UI
        cafeImage.image = UIImage(named: cafeImageString)
        
        cafeNameLabel.font = .boldSystemFont(ofSize: 23)
        cafeNameLabel.textAlignment = .center
        cafeNameLabel.text = cafeNameString
        
        cafeInstarButton.setTitle(cafeInstarString, for: .normal)
        cafeInstarButton.setTitleColor(.darkGray, for: .normal)
        cafeInstarButton.contentHorizontalAlignment = .left
        cafeInstarButton.addTarget(self, action: #selector(didTabInstarButton(_:)), for: .touchUpInside)
        
        cafeOpenHourLabel.text = cafeOpenHourString
        cafeOpenHourLabel.textColor = .gray
        
        cafeMenuLabel.text = cafeMenuString
        cafeMenuLabel.numberOfLines = 0
        cafeMenuLabel.textColor = .gray
        
        cafeAddressLabel.text = cafeAddressString
        cafeAddressLabel.textColor = .gray
        
        contentView.backgroundColor = .darkGray
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(cafeNameLabel)
        scrollView.addSubview(cafeImage)
        scrollView.addSubview(instarIcon)
        scrollView.addSubview(openIcon)
        scrollView.addSubview(menuIcon)
        scrollView.addSubview(addressIcon)
        
        scrollView.addSubview(cafeInstarButton)
        scrollView.addSubview(cafeOpenHourLabel)
        scrollView.addSubview(cafeMenuLabel)
        scrollView.addSubview(cafeAddressLabel)
        
        scrollView.addSubview(contentView)
        
        scrollView.addSubview(mapView)
        
    }
    
    // MARK: - Map Func
    private func geocodeAddressString() {
        
        print("geocodeAddressString 입성")
        
        let pensionAddress = cafeAddressString
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(pensionAddress) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let place = placeMark?.first else { return }
            
            let coordinate = place.location?.coordinate
            
            self.setRegion(coordinate: coordinate!)
            self.pin(latitude: coordinate!.latitude, logitude: coordinate!.longitude)
        }
    }
    // MARK: - map Pin
    private func pin(latitude: CLLocationDegrees, logitude: CLLocationDegrees) {
        print("pin func 입성")
        let pensionArea = MKPointAnnotation()
        pensionArea.title = cafeNameString
        pensionArea.coordinate = CLLocationCoordinate2DMake(latitude, logitude)
        mapView.addAnnotation(pensionArea)
    }
    
    // MARK: - setRegion
     private func setRegion(coordinate: CLLocationCoordinate2D) {
         print("setRegion func 입성")
          let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
          let region = MKCoordinateRegion(center: coordinate, span: span)
          
          mapView.setRegion(region, animated: true)
      }
    
    
    // MARK: - objc Func
    @objc private func didTabInstarButton(_ sender: UIButton) {
        print("instar 버튼 클릭")
    }
    @objc private func didTabBackButton(_ sender: UIButton) {
        print("backButtonClick")
        dismiss(animated: true)
    }
    
}

// MARK: - extension Map
extension CafeDetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else { return MKOverlayRenderer(overlay: overlay) }

        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 2

        return renderer
    }
}
