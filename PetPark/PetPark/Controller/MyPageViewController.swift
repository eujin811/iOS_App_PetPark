//
//  MyPageViewController.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
  let userTableView = UITableView()
  let imagePickerController = UIImagePickerController()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "PetPark"
    
    setupUI()
    setupAnchor()
    
  }
  private func setupUI() {
    self.view.backgroundColor = .white
    
    userTableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: MyPageTableViewCell.identifier)
    userTableView.register(MyPageCafeTableViewCell.self, forCellReuseIdentifier: MyPageCafeTableViewCell.identifier)
    userTableView.register(MyPagePensionTableViewCell.self, forCellReuseIdentifier: MyPagePensionTableViewCell.identifier)
    
    
    imagePickerController.delegate = self
    
    userTableView.dataSource = self
    
    userTableView.delegate = self
    userTableView.rowHeight = view.safeAreaLayoutGuide.layoutFrame.height/3
  }
  
  private func setupAnchor() {
    [userTableView].forEach {
      self.view.addSubview($0)
    }
    
    let guide = view.safeAreaLayoutGuide
    userTableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      userTableView.topAnchor.constraint(equalTo: guide.topAnchor),
      userTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      userTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      //            likeTableView.heightAnchor.constraint(equalToConstant: guide.layoutFrame.height / 3),
      userTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
    
  }
  
}

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        switch indexPath.row {
        case 0:
            let likeCell = tableView.dequeueReusableCell(withIdentifier: MyPageTableViewCell.identifier, for: indexPath) as! MyPageTableViewCell
            likeCell.tableViewInfo(photoImage: "조커", nickName: "조커")
            likeCell.delegate = self
            cell = likeCell
        case 1:
            let cafeCell = tableView.dequeueReusableCell(withIdentifier: MyPageCafeTableViewCell.identifier, for: indexPath) as! MyPageCafeTableViewCell
            cafeCell.delegate = self
            cell = cafeCell
        case 2:
            let pensionCell = tableView.dequeueReusableCell(withIdentifier: MyPagePensionTableViewCell.identifier, for: indexPath) as!
                MyPagePensionTableViewCell
            pensionCell.delegate = self
            cell = pensionCell
            
        default:
        cell = UITableViewCell()
        }
        return cell
    }
}

extension MyPageViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    if indexPath.row == 0 {
      return view.safeAreaLayoutGuide.layoutFrame.height / 4
    }
    return view.safeAreaLayoutGuide.layoutFrame.height / 2
  }
  
  //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  //        tableView.deselectRow(at: indexPath, animated: true)
  //    }
  func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    nil
  }
  
}

extension MyPageViewController: MyPageTableViewCellDelegate {
  func whenPickImageButtonDidTap() {
    guard UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) else { return }
    
    imagePickerController.sourceType = .savedPhotosAlbum
    
    present(imagePickerController, animated: true)
  }
}

extension MyPageViewController: UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let selectedImage = info[.originalImage] as! UIImage
    let userInfoCell = userTableView.cellForRow(at: [0, 0]) as! MyPageTableViewCell
    
    userInfoCell.setUserImage(selectedImage)
    
    dismiss(animated: true)
  }
  
}

extension MyPageViewController: UINavigationControllerDelegate {}

extension MyPageViewController: MyPageCafeTableViewCellDelegate {
    func selectedItem(indexPath: IndexPath) {
        let test = CafeReviewViewController()
        
//        test.modalPresentationStyle = .fullScreen
        present(test, animated: true)
    }
}

extension MyPageViewController: MyPagePensionTableViewCellDelegate {
    func selectItem(indexPath: IndexPath) {
        let test = CafeReviewViewController()
        
//        test.modalPresentationStyle = .fullScreen
        present(test, animated: true)
    }
}
