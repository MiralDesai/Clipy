//
//  AppMenu.swift
//  Clipy
//
//  Created by Miral Desai on 26/11/2023.
//

import SwiftUI
import RealmSwift
import AppKit

struct AppMenu: View {
  @ObservedObject var viewModel: AppMenuViewModel

  var body: some View {
    let counts = viewModel.clipCounts(for: viewModel.clips)

    VStack {
      ForEach(viewModel.clips.indices, id: \.self) { (index) in
        let batch = viewModel.clips[index]
        Menu {
          ClipsList(clips: batch)
        } label: {
          Image(systemName: "folder")
          Text("\(counts[index])")
        }
      }
    }
    Divider()
    Button("Clear history") {
      viewModel.clips = []
      viewModel.clearClipboardHistory()
    }.keyboardShortcut(KeyEquivalent.delete, modifiers: [.command, .option])
    if #available(macOS 14.0, *) {
      SettingsLink {Text("Preferences")}.keyboardShortcut(",")
    } else {
      Button {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
      } label: {
        Text("Preferences").keyboardShortcut(",")
      }
    }
    Button("Quit") {NSApplication.shared.terminate(nil)}.keyboardShortcut("Q")
  }
}

#Preview {
  AppMenu(viewModel: AppMenuViewModel())
}
