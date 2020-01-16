//
//  CafeData.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation

struct PetCafe {
  let category: String
  let cafes: [Cafe]
}

struct Cafe {
  let name: String
  let location: String
  let imageName: String
  let instagramName: String
  let operationTime: String
}

let cafeData: [PetCafe] = [
  PetCafe(category: "애견카페", cafes: [
    Cafe(name: "아이러브퍼피", location: "경기도 김포시", imageName: "cafe1",
         instagramName: "cafe__ilovepuppy", operationTime: "12:00 - 22:00"),
    Cafe(name: "써니네", location: "서울시 마포구", imageName: "cafe2",
         instagramName: "sunnyne_in_korea", operationTime: "07:30 - 20:30"),
    Cafe(name: "카카오독", location: "서울 강서구", imageName: "cafe3",
         instagramName: "rich__________________", operationTime: "13:00 ~ 22:00"),
    Cafe(name: "위드랜드", location: "서울 강남구", imageName: "cafe4",
         instagramName: "withland_pet", operationTime: "10:30 - 22:00"),
    Cafe(name: "개그멍", location: "서울 노원구", imageName: "cafe5",
         instagramName: "gagmung", operationTime: "13:00 - 22:00"),
    Cafe(name: "멍멍멍", location: "서울 송파구", imageName: "cafe6",
         instagramName: "mungmung.mung", operationTime: "12:00 - 21:00"),
    Cafe(name: "바우라움", location: "서울 성동구", imageName: "cafe7",
         instagramName: "bowraum_official", operationTime: "10:30 - 21:00"),
    Cafe(name: "다시사랑받개", location: "서울 중랑구", imageName: "cafe8",
         instagramName: "saac_ch", operationTime: "11:00 - 21:30"),
    Cafe(name: "괜찮아우리사이", location: "서울 광진구", imageName: "cafe9",
         instagramName: "weareoui", operationTime: "12:00 - 22:00"),
    Cafe(name: "퍼피앤커피", location: "서울 관악구", imageName: "cafe10",
         instagramName: "puppyncoffee", operationTime: "12:00 - 22:00"),
    Cafe(name: "카페멍스", location: "서울 노원구", imageName: "cafe11",
         instagramName: "cafe_meongs", operationTime: "12:00 - 22:00"),
    Cafe(name: "왓더독", location: "서울 강서구", imageName: "cafe12",
         instagramName: "what_the_dok", operationTime: "07:30 - 20:30"),
    Cafe(name: "멍살롱", location: "서울 구로구", imageName: "cafe13",
         instagramName: "mungsalon_", operationTime: "08:00 - 20:00"),
    Cafe(name: "개랑 놀아주는 남자", location: "서울 서초구", imageName: "cafe14",
         instagramName: "dognolja", operationTime: "09:30 - 23:00")
  ])
]
