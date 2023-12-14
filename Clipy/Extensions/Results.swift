//
//  Results.swift
//  Clipy
//
//  Created by Miral Desai on 14/12/2023.
//

import RealmSwift

extension Results {
  func asArray() -> [Element] {
    return Array(self)
  }
}
