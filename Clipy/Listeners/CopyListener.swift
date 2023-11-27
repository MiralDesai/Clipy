//
//  CopyListener.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//
//  A listener that will periodically check if the pasteboard
//  has changed, indicating that the user has copied something

import SwiftUI

class CopyListener {
  static func start() {
    let pasteboard = NSPasteboard.general
    var lastChangeCount = pasteboard.changeCount

    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
      if pasteboard.changeCount != lastChangeCount {
        // Pasteboard changed, do something
        lastChangeCount = pasteboard.changeCount
      }
    }
  }
}
