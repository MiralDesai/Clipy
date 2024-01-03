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

  func upsert(_ clip: Clip) {
    try! realm.write {
      realm.add(clip)
    }
  }

  func refreshUpdatedAt(_ clip: Clip) {
    try! realm.write {
      clip.updatedAt = Date().unixTimestamp
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

  func findByContent(content: Data) -> Clip? {
    realm.objects(Clip.self).where { $0.content == content }.first
  }
}
