//
//  CopyListener.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//
//  A listener that will periodically check if the pasteboard
//  has changed, indicating that the user has copied something

import SwiftUI

class CopyListener: ObservableObject {
  @Published var clipAdded: Bool = false
  
  private static var sharedListener: CopyListener?
  
  static func shared() -> CopyListener {
    if let existingListener = sharedListener {
      return existingListener
    } else {
      let newListener = CopyListener()
      sharedListener = newListener
      return newListener
    }
  }
  
  func start() {
    let pasteboard = NSPasteboard.general
    var lastChangeCount = pasteboard.changeCount
    
    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _timer in
      if pasteboard.changeCount != lastChangeCount {
        // Pasteboard changed, do something
        ClipRepository.init().upsert()
        self.clipAdded = true
        lastChangeCount = pasteboard.changeCount
      }
    }
  }
}
