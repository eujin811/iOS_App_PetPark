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
    private let introduceImage = UIImageView()
    
    private let scrollView = UIScrollView()
    private let pensionImage = UIImageView()
    private let pensionNameLabel = UILabel()
    private let pensionSite = UILabel()
    private let pensionNum = UILabel()
    private let pensionAddress = UILabel()
    private let pensionIntroduce = UILabel()
    
    
    
    private let mapView = MKMapView()
//    let addressString = String()
    
    let pensionName = "사랑가득 펜션"
    let addressString = "서울시 서초구"
    let siteString = "https://github.com/eujin811"
    let numString = "02 - 000 - 0000"
    let introduceString = "안녕하세요~~ 귀여운 멍멍이들 24마리와 놀러온 친구들까지 모두 모여 수영장 파티를 하는 귀요미 애견 펜션이에요!! 놀러온 친구들 모두 행복해 한답니다 ㅎㅎ"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "펜션 상세화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "lessthan"), style: .plain, target: self, action: #selector(didTabBackButton(_:)))
        
        attribute()
        geocodeAddressString()  //map pin
        setUpUI()
        
//        geocodeAddressString()  //map pin
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
        
        //
        introduceImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            introduceImage.heightAnchor.constraint(equalToConstant: miniImageLine),
            introduceImage.widthAnchor.constraint(equalToConstant: miniImageLine - 3),
            introduceImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: miniImageMargin),
            introduceImage.topAnchor.constraint(equalTo: pensionNameLabel.bottomAnchor, constant: margin)
        ])
        
        pensionIntroduce.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pensionIntroduce.leadingAnchor.constraint(equalTo: introduceImage.trailingAnchor, constant: padding),
            pensionIntroduce.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(margin + padding)),
//            pensionIntroduce.centerYAnchor.constraint(equalTo: introduceImage.centerYAnchor)
            pensionIntroduce.topAnchor.constraint(equalTo: introduceImage.topAnchor)
        ])
        
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneImage.heightAnchor.constraint(equalToConstant: miniImageLine),
            phoneImage.widthAnchor.constraint(equalToConstant: miniImageLine),
            phoneImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: miniImageMargin),
            phoneImage.topAnchor.constraint(equalTo: pensionIntroduce.bottomAnchor, constant: padding)
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
            mapImage.topAnchor.constraint(equalTo: siteImage.bottomAnchor, constant: margin)
        ])
        
        pensionAddress.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pensionAddress.centerYAnchor.constraint(equalTo: mapImage.centerYAnchor),
            pensionAddress.leadingAnchor.constraint(equalTo: mapImage.trailingAnchor, constant: padding),
            pensionAddress.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
        ])
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: pensionAddress.bottomAnchor, constant: padding),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin + padding),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(margin + padding)),
            mapView.heightAnchor.constraint(equalToConstant: viewWidth * (2/5))
        ])
        
        
    }
    
    // MARK: - attribute
    private func attribute() {
        
        // MARK: - MapKit UI
        mapView.delegate = self
        view.addSubview(mapView)
        
        // MARK: - UISetData
        phoneImage.image = UIImage(systemName: "phone.fill")
        phoneImage.tintColor = .gray
        siteImage.image = UIImage(systemName: "house.fill")
        siteImage.tintColor = .gray
        mapImage.image = UIImage(systemName: "map.fill")
        mapImage.tintColor = .gray
        introduceImage.image = UIImage(systemName: "doc.text.fill")
        introduceImage.tintColor = .gray
                
        pensionImage.image = UIImage(named: "pension1")
        
        
        pensionNameLabel.font = .boldSystemFont(ofSize: 23)
        pensionNameLabel.textAlignment = .center
        
        
        pensionNameLabel.text = pensionName
        
        pensionAddress.textColor = .gray
        pensionAddress.text = addressString
        
        pensionSite.textColor = .darkGray
        pensionSite.text = siteString
        
        pensionNum.text = numString
        pensionNum.textColor = .darkGray
        
        pensionIntroduce.text = introduceString
        pensionIntroduce.numberOfLines = 4
        
        view.addSubview(scrollView)
        view.addSubview(phoneImage)
        view.addSubview(pensionImage)
        view.addSubview(pensionNameLabel)
        view.addSubview(pensionSite)
        view.addSubview(pensionNum)
        view.addSubview(pensionAddress)
        view.addSubview(siteImage)
        view.addSubview(mapImage)
        view.addSubview(introduceImage)
        view.addSubview(pensionIntroduce)
        //        scrollView.backgroundColor = .green
        
    }
    
    // MARK: - 주소 -> 위경도 변환.
    private func geocodeAddressString() {
        
        print("geocodeAddressString 입성")
        
        let pensionAddress = addressString
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
        pensionArea.title = pensionName
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
    
    @objc private func didTabBackButton(_ sender: Any) {
        //        dismiss(animated: true)
        print("didTabBackButton")
        dismiss(animated: true)
    }
}

extension PensionDetailViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else { return MKOverlayRenderer(overlay: overlay) }
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = .blue
        renderer.lineWidth = 2
        
        return renderer
    }
}
