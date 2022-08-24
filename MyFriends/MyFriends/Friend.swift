//
//  Friend.swift
//  MyFriends
//
//  Created by 지희의 MAC on 2022/08/23.
//

import Foundation

struct Friend{
    
    struct Address{
        let country: String
        let city: String
    }
    
    let name: String
    let age: Int
    let address_info: Address
}
