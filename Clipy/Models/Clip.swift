//
//  Clip.swift
//  Clipy
//
//  Created by Miral Desai on 28/11/2023.
//

import SwiftUI
import RealmSwift

enum ClipType: String, PersistableEnum {
  case string = ".string"
  case color = ".color"
}

class Clip: Object {
  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var content: Data
  @Persisted var type: ClipType
  @Persisted var createdAt: Int
  @Persisted var updatedAt: Int
}
