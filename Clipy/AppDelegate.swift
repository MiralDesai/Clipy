//
//  AppDelegate.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
  func applicationDidFinishLaunching(_ notification: Notification) {
    print("Clipy started up!")

    CopyListener.start()
  }
}
