//
//  ClipRow.swift
//  Clipy
//
//  Created by Miral Desai on 12/12/2023.
//

import SwiftUI

struct ClipRow: View {
  @State private var pasteImmediately = UserDefaults.standard.bool(forKey: Constants.AppStorageKeys.pasteImmediately)
  var clip: Clip

  var body: some View {
    Button {
      NSPasteboard.general.clearContents()
      NSPasteboard.general.setData(clip.content, forType: NSPasteboard.PasteboardType(clip.type.rawValue))
      if pasteImmediately {
        PasteManager.init().paste()
      }
    } label: {
      Text(clip.content.toString().truncate(length: 30))
    }
  }
}
