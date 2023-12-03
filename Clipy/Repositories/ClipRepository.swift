//
//  Clip.swift
//  Clipy
//
//  Created by Miral Desai on 30/11/2023.
//

import SwiftUI
import RealmSwift

class ClipRepository {
  let realm: Realm
  
  init(realm: Realm = try! Realm()) {
    self.realm = realm
  }
  
  func getStringFromClipboard() -> Data? {
    guard let copiedString = NSPasteboard.general.string(forType: .string)?.data(using: .utf8)  else {
      return nil
    }
    return copiedString
  }
  
  func upsert() {
    let content = getStringFromClipboard()
    guard content != nil else { return }

    let clip = Clip()
    clip.content = content!
    clip.type = ClipType.string
    clip.createdAt = Date().unixTimestamp
    clip.updatedAt = Date().unixTimestamp
    
    try! realm.write {
      realm.add(clip)
    }
  }

  func read() {
    let items = realm.objects(Clip.self)

    for item in items {
      let stuff = String(data: item.content, encoding: .utf8)!
      print("Data: \(stuff), Type: \(item.type.rawValue)")
    }
  }
}
