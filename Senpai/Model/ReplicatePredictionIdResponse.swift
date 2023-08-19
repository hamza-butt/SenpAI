//
//  ReplicatePredictionIdResponse.swift
//  Senpai
//
//  Created by Hamza Butt on 8/19/23.
//

import SwiftUI





struct ReplicatePredictionIdResponse : Codable {
    let id : String?
    let version : String?
    let input : Input?
    let logs : String?
    let error : String?
    let status : String?
    let created_at : String?
    let urls : Urls?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case version = "version"
        case input = "input"
        case logs = "logs"
        case error = "error"
        case status = "status"
        case created_at = "created_at"
        case urls = "urls"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        input = try values.decodeIfPresent(Input.self, forKey: .input)
        logs = try values.decodeIfPresent(String.self, forKey: .logs)
        error = try values.decodeIfPresent(String.self, forKey: .error)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        urls = try values.decodeIfPresent(Urls.self, forKey: .urls)
    }

}




struct Input : Codable {
    let motion_module : String?

    enum CodingKeys: String, CodingKey {

        case motion_module = "motion_module"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        motion_module = try values.decodeIfPresent(String.self, forKey: .motion_module)
    }

}



struct Urls : Codable {
    let cancel : String?
    let get : String?

    enum CodingKeys: String, CodingKey {

        case cancel = "cancel"
        case get = "get"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cancel = try values.decodeIfPresent(String.self, forKey: .cancel)
        get = try values.decodeIfPresent(String.self, forKey: .get)
    }

}
