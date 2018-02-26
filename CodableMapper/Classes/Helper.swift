//
//  Helper.swift
//  CodableMapper
//
//  Created by Tomoya Hirano on 2018/02/26.
//

import Foundation

struct ContainerKey: CodingKey {
  var stringValue: String = ""
  var intValue: Int? = nil
  
  init?(stringValue: String) {
    self.stringValue = stringValue
  }
  
  init?(intValue: Int) {
    self.intValue = intValue
  }
}

