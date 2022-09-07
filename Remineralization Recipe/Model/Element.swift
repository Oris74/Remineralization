//
//  Element.swift
//  Remineralization Recipe
//
//  Created by Laurent Debeaujon on 07/09/2022.
//

import Foundation

struct Element: Codable  {
    let symbol: String
    let name: String
    let atomicMass: Float
    let valence: Int

    enum CodingKeys: String, CodingKey {
        case symbol = "symbol"
        case name = "name"
        case atomicMass = "atomic_mass"
        case valence = "valence"
    }

}
