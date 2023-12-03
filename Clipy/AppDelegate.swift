//
//  AppDelegate.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//

import AppKit
import RealmSwift

class AppDelegate: NSObject, NSApplicationDelegate {
  func applicationDidFinishLaunching(_ notification: Notification) {
    print("Clipy started up!")
    /// TODO: Remove before release, for development only
    let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    let realm = try! Realm(configuration: config)

    ClipRepository().read()

    CopyListener.start()
  }
}
