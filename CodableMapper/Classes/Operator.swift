//
//  Operator.swift
//  CodableMapper
//
//  Created by Tomoya Hirano on 2018/02/26.
//

import Foundation

precedencegroup Base {
  associativity: left
  lowerThan: AdditionPrecedence
}

infix operator <- : Base

public func <- <T: Decodable>(left: inout T, right: T?) {
  left = right ?? left
}

public func <- <Transform: TransformType>(left: inout Transform.Object, right: (Transform.JSON?, Transform)) {
  left = right.1.transform(right.0) ?? left
}

public func <- <Transform: TransformType>(left: inout Transform.Object?, right: (Transform.JSON?, Transform)) {
  left = right.1.transform(right.0) ?? left
}

