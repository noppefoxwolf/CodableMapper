//
//  Decodable+Extensions.swift
//  CodableMapper
//
//  Created by Tomoya Hirano on 2018/02/26.
//

import UIKit

extension Decodable {
  public init?(JSONString: String) {
    if let data = JSONString.data(using: .utf8), let obj: Self = try? JSONDecoder().decode(Self.self, from: data) {
      self = obj
    } else {
      return nil
    }
  }
}
