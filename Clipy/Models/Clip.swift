//
//  Clip.swift
//  Clipy
//
//  Created by Miral Desai on 28/11/2023.
//

import SwiftUI
import RealmSwift

enum ClipType: String, PersistableEnum {
  case string = "public.utf8-plain-text"
  case filePath = "public.file-url"
}

class Clip: Object {
  static let supportedTypes: [NSPasteboard.PasteboardType] = [
    .string,
    .fileURL
  ]

  @Persisted(primaryKey: true) var _id: ObjectId
  @Persisted var content: Data
  @Persisted var type: ClipType
  @Persisted var createdAt: Int
  @Persisted var updatedAt: Int
}
