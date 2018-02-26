//
//  DateTransform.swift
//  CodableMapper
//
//  Created by Tomoya Hirano on 2018/02/26.
//

import Foundation

public struct DateTransform: TransformType {
  public typealias Object = Date
  public typealias JSON = String
  
  public init() {}
  
  public func transform(_ value: String?) -> Date? {
    guard let value = value else { return nil }
    let formatter = DateFormatter()
    formatter.calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    formatter.dateFormat = "yyyy/MM/dd HH:mm:ss Z"
    return formatter.date(from: value)
  }
}
