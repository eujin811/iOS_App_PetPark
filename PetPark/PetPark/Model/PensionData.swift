//
//  PensionData.swift
//  PetPark
//
//  Created by 황정덕 on 2020/01/16.
//  Copyright © 2020 Gitbot. All rights reserved.
//

import Foundation

import Foundation

struct Pension {
  let name: String
  let location: String
  let imageName: String
  let siteName: String
  let phoneName: String
}

struct PetPension {
  let category: String
  let pensions: [Pension]
}


let pensionData: [PetPension] = [
  PetPension(category: "애견펜션", pensions: [
    Pension(name: "스톤애견풀빌라", location: "경기 가평군 조종면 현등사길 55-231", imageName: "pension1", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1285629759&matchSidRoomIds=2866643%2C2866668%2C2866673%2C2866675%2C2866676%2C2866686%2C2866694%2C2866700%2C2866703%2C2866709%2C2866725%2C3247782%2C2865938%2C2866730%2C2866606%2C2866732%2C2866612%2C2866741%2C2866616%2C2866746%2C2866621%2C2866758%2C2866624%2C2866763%2C2866633%2C2866636&query=%EC%8A%A4%ED%86%A4%EC%95%A0%EA%B2%AC%ED%92%80%EB%B9%8C%EB%9D%BC", phoneName: "01092117741"),
    Pension(name: "하루강아지애견펜션", location: "경기 가평군 상면 수목원로386번길 12-17", imageName: "pension2", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1382820761&matchSidRoomIds=3121096%2C3121099%2C3114064%2C3120401%2C3120404%2C3120405%2C3114205%2C3120407%2C3120961%2C3121051%2C3121055%2C3121057%2C3121061%2C3121062%2C3113848%2C3120409%2C3120410%2C3121159%2C3121064&query=%ED%95%98%EB%A3%A8%EA%B0%95%EC%95%84%EC%A7%80%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01089352459"),
    Pension(name: "벨르앙쥬애견펜션", location: "경기 가평군 상면 임초밤안골로 269-14", imageName: "pension3", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1040726839&matchSidRoomIds=2886314%2C2886332%2C2886338%2C2886339%2C2886341%2C2886342%2C2886344%2C2886299%2C2886308%2C2886309%2C2886310%2C2886311%2C2886312%2C2886313&query=%EB%B2%A8%EB%A5%B4%EC%95%99%EC%A5%AC%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%9", phoneName: "01043883011"),
    Pension(name: "퀸스타운애견펜션", location: "경기 양평군 단월면 석산로 1539-10", imageName: "pension4", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1308339764&matchSidRoomIds=2988453%2C2988422%2C3000735%2C2988463%2C2988503%2C3009782%2C2988514&query=%ED%80%B8%EC%8A%A4%ED%83%80%EC%9A%B4%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01033695618"),
    Pension(name: "꼬로몽 애견펜션", location: "강원 양양군 서면 원당골길 111", imageName: "pension5", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1318534345&matchSidRoomIds=3033293%2C3036337%2C3036338%2C3036340&query=%EA%BC%AC%EB%A1%9C%EB%AA%BD%20%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01030308817"),
    Pension(name: "솔푸른향기 애견펜션", location: "충남 태안군 안면읍 수해길 85-71", imageName: "pension6", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=37642177&matchSidRoomIds=3169422%2C3169433%2C3169435%2C3169444%2C3169450%2C3169456%2C3169460%2C3169471%2C3169476&query=%EC%86%94%ED%91%B8%EB%A5%B8%ED%96%A5%EA%B8%B0%20%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01030705929"),
    Pension(name: "도담도담애견펜션", location: "충남 태안군 안면읍 삼봉길 116", imageName: "pension7", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=881048629&matchSidRoomIds=2578638%2C2578631%2C2578633%2C2578603%2C2578627%2C2578642&query=%EB%8F%84%EB%8B%B4%EB%8F%84%EB%8B%B4%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01083150611"),
    Pension(name: "슈가몽 애견펜션", location: "충남 태안군 안면읍 방죽길 106", imageName: "pension8", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1147800653&matchSidRoomIds=3134879%2C3134880%2C3134884%2C3134889%2C3134893%2C3134895&query=%EC%8A%88%EA%B0%80%EB%AA%BD%20%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01022725879"),
    Pension(name: "라온애견펜션", location: "충남 태안군 남면 진산1길 229-76", imageName: "pension9", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1882558637&matchSidRoomIds=2836111%2C2836138%2C2836192%2C2836195%2C2836193&query=%EB%9D%BC%EC%98%A8%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01032611830"),
    Pension(name: "아지트애견펜션", location: "강원 홍천군 북방면 노일로 524-21", imageName: "pension10", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1988111442&matchSidRoomIds=3164549%2C3164553%2C3164556%2C3164528%2C3164532%2C3164535%2C3164543&query=%EC%95%84%EC%A7%80%ED%8A%B8%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01091837372"),
    Pension(name: "프리미엄 애견풀빌라", location: "경기 가평군 조종면 현등사길 55-231", imageName: "pension11", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1915746670&matchSidRoomIds=2746928%2C2746929%2C2746931%2C2746930%2C2746902%2C2746905%2C2746879%2C2746887&query=%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84%20%EC%95%A0%EA%B2%AC%ED%92%80%EB%B9%8C%EB%9D%BC", phoneName: "01092117741"),
    Pension(name: "펫티움애견펜션", location: "경기 가평군 북면 가화로 1364-66", imageName: "pension12", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=1547886882&matchSidRoomIds=3154672%2C3152470%2C3154261%2C3154652%2C3154656%2C3154660%2C3154663%2C3154667&query=%ED%8E%AB%ED%8B%B0%EC%9B%80%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01076278245"),
    Pension(name: "커플애견동반 구름펜션", location: "충남 태안군 안면읍 꽃지1길 142", imageName: "pension13", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=13009319&matchSidRoomIds=2474202%2C2474733%2C2474920%2C2474928%2C2474940%2C2475347%2C2475349%2C2475351%2C2475541%2C2474016&query=%EC%BB%A4%ED%94%8C%EC%95%A0%EA%B2%AC%EB%8F%99%EB%B0%98%20%EA%B5%AC%EB%A6%84%ED%8E%9C%EC%85%98", phoneName: "01092458848"),
    Pension(name: "엘리스산장애견펜션", location: "경기 가평군 설악면 어비산길 204", imageName: "pension14", siteName: "https://store.naver.com/accommodations/detail?entry=pbl&id=11888242&matchSidRoomIds=2677302%2C2677341%2C2677355&query=%EC%97%98%EB%A6%AC%EC%8A%A4%EC%82%B0%EC%9E%A5%EC%95%A0%EA%B2%AC%ED%8E%9C%EC%85%98", phoneName: "01093891691"),
    
  ])
]
