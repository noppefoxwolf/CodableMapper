//
//  TransformType.swift
//  CodableMapper
//
//  Created by Tomoya Hirano on 2018/02/26.
//

import Foundation

public protocol TransformType {
  associatedtype Object
  associatedtype JSON: Decodable
  
  func transform(_ value: JSON?) -> Object?
}
