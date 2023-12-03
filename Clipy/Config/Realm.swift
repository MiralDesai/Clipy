//
//  Realm.swift
//  Clipy
//
//  Created by Miral Desai on 27/11/2023.
//

import RealmSwift

extension Realm {
  static func migration() {
    let config = Realm.Configuration(schemaVersion: 0, migrationBlock: { _migration, _oldSchemaVersion in
    })

    Realm.Configuration.defaultConfiguration = config

    // swiftlint:disable force_try
    _ = try! Realm()
    // swiftlint:enable force_try
  }
}
