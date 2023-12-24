//
//  Data.swift
//  Clipy
//
//  Created by Miral Desai on 23/12/2023.
//

import Foundation

extension Data {
  func toString() -> String {
    return String(data: self, encoding: .utf8)!
  }
}
