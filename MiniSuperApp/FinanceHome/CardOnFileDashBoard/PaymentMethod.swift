//
//  PaymentMethod.swift
//  MiniSuperApp
//
//  Created by 이든_장진혁 on 2022/12/29.
//

import Foundation


struct PaymentMethod: Decodable {
    let id: String
    let name: String
    let digits: String
    let color: String
    let isPrimary: Bool
}
