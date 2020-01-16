//
//  MainTabBarController.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/15.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  private let cafeVC = UINavigationController(rootViewController: CafeViewController())
  private let pensionVC = UINavigationController(rootViewController: PensionViewController())
  private let myPageVC = UINavigationController(rootViewController: MyPageViewController())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    cafeVC.tabBarItem = UITabBarItem(title: "Cafe", image: nil, tag: 0)
    pensionVC.tabBarItem = UITabBarItem(title: "Pension", image: nil, tag: 1)
    myPageVC.tabBarItem = UITabBarItem(title: "MyPage", image: nil, tag: 2)
    viewControllers = [cafeVC, pensionVC, myPageVC]
  }
}
