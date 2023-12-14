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

  // TODO: Move this method somewhere else 
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
  
  func deleteAll() {
    let allClips = realm.objects(Clip.self)

    try! realm.write {
      realm.delete(allClips)
    }
  }

  func sortedByUpdatedAt() -> Results<Clip> {
    realm.objects(Clip.self).sorted(byKeyPath: "updatedAt", ascending: false)
  }
}
