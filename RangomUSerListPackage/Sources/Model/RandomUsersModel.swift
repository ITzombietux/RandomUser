//
//  RandomUsersModel.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import Foundation

public struct RandomUsersResponse: Codable {
    public let results: ResultsResponse
    public let info: InfoResponse
}

public struct ResultsResponse: Codable {
    public let name: NameResponse
    public let email: String
    public let login: LoginResponse
    public let picture: PictureResponse
}

public struct NameResponse: Codable {
    public let title: String
    public let first: String
    public let last: String
}

public struct LoginResponse: Codable {
    public let uuid: String
    public let username: String
}

public struct PictureResponse: Codable {
    public let large: String
    public let medium: String
    public let thumbnail: String
}

public struct InfoResponse: Codable {
    let seed: String
    let results: Int
    public let page: Int
    let version: String
}
