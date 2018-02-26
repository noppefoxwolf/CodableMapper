//
//  Decoder+Extensions.swift
//  CodableMapper
//
//  Created by Tomoya Hirano on 2018/02/26.
//

import Foundation

extension Decoder {
  public subscript<T: Decodable>(key: String) -> T? {
    get {
      return Self.decode(self, key: key)
    }
  }
  
  static func decode<T: Decodable>(_ decorder: Decoder, key: String) -> T? {
    guard let container = try? decorder.container(keyedBy: ContainerKey.self) else { return nil }
    let keys = key.components(separatedBy: ".")
    if keys.count == 1 {
      guard let containerKey = ContainerKey(stringValue: key) else { return nil }
      guard let value = try? container.decode(T.self, forKey: containerKey) else { return nil }
      return value
    } else {
      guard let rootKey = keys.first, let containerKey = ContainerKey(stringValue: rootKey) else { return nil }
      let otherKey = keys.dropFirst().joined(separator: ".")
      guard let superContainer = try? container.superDecoder(forKey: containerKey) else { return nil }
      guard let value: T? = decode(superContainer, key: otherKey) else { return nil }
      return value
    }
  }
}
