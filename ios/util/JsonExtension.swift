//
//  JsonExtension.swift
//  ios
//
//  Created by YeongWooKim on 12/31/23.
//

import Foundation

extension JSONEncoder {
    static let shared = setup()
    
    private static func setup() -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(.shared)
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }
}

extension JSONDecoder {
    static let shared = setup()
    
    private static func setup() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.shared)
        return decoder
    }
}
