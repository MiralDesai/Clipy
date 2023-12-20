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
    CopyListener.shared().start()
  }
}
