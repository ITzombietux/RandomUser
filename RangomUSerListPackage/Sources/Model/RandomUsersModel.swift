//
//  RandomUsersModel.swift
//  
//
//  Created by 10004 on 2023/10/02.
//

import Foundation

public struct RandomUsersResponse: Codable {
    public let results: [ResultsResponse]
    public let info: InfoResponse
    
    public init(results: [ResultsResponse] = [],
                info: InfoResponse = InfoResponse()) {
        self.results = results
        self.info = info
    }
}

public struct ResultsResponse: Codable {
    public let name: NameResponse
    public let email: String
    public let login: LoginResponse
    public let picture: PictureResponse
    
    public init(name: NameResponse = NameResponse(),
                email: String = "",
                login: LoginResponse = LoginResponse(),
                picture: PictureResponse = PictureResponse()) {
        self.name = name
        self.email = email
        self.login = login
        self.picture = picture
    }
}

public struct NameResponse: Codable {
    public let title: String
    public let first: String
    public let last: String
    
    public init(title: String = "", first: String = "", last: String = "") {
        self.title = title
        self.first = first
        self.last = last
    }
}

public struct LoginResponse: Codable {
    public let uuid: String
    public let username: String
    
    public init(uuid: String = "", username: String = "") {
        self.uuid = uuid
        self.username = username
    }
}

public struct PictureResponse: Codable {
    public let large: String
    public let medium: String
    public let thumbnail: String
    
    public init(large: String = "", medium: String = "", thumbnail: String = "") {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
}

public struct InfoResponse: Codable {
    let seed: String
    let results: Int
    public let page: Int
    let version: String
    
    public init(seed: String = "", results: Int = 1, page: Int = 1, version: String = "") {
        self.seed = seed
        self.results = results
        self.page = page
        self.version = version
    }
}
