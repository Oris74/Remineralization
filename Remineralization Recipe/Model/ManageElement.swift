//
//  ManageElement.swift
//  Remineralization Recipe
//
//  Created by Laurent Debeaujon on 07/09/2022.
//

import Foundation

class ManageElement {
    static var shared = ManageElement()

    var periodicTable = [Element]()

    private var elementsJSON: Data? {
        let bundle = Bundle(for: ManageElement.self)
        let url = bundle.url(forResource: "Elements", withExtension: "json")!
        return try? Data(contentsOf: url)
    }

    func importPeriodicTable(completion: @escaping (Utilities.ManageError?) -> Void) {
        let networkService = NetworkService()
        networkService.decodeJSON(type: [Element]?.self, data: self.elementsJSON, completionJSON: {[weak self] (dataDecoded, error) in
            guard let postalCode = dataDecoded else { return }
            self?.periodicTable = postalCode
            completion(error)
        })
    }

    func getElement(withSymbole symbol: String) -> Element? {
        for element in periodicTable {
            if element.symbol == symbol {
                return element
            }
        }
        return nil
    }
}
