//
//  NetworkProtocol.swift
//  Remineralization Recipe
//
//  Created by Laurent Debeaujon on 07/09/2022.
//

import Foundation

// MARK: Make NetworkService
protocol NetworkProtocol {
    init( networkSession: URLSession)

    func getAPIData<T: Decodable>(
        _ endpointApi: URL?,
        _ parameters: [[KeyRequest:String]]?,
        _ apiStruct: T?.Type,
        completionHandler : @escaping (T?, Utilities.ManageError?) -> Void)
}
