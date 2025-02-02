//
//  GeneralSettingsTabView.swift
//  Clipy
//
//  Created by Miral Desai on 24/11/2023.
//

import SwiftUI
import KeyboardShortcuts
import LaunchAtLogin

struct GeneralSettingsTabView: View {
  @AppStorage(Constants.AppStorageKeys.pasteImmediately) private var pasteImmediately: Bool = true
  @AppStorage(Constants.AppStorageKeys.pasteWithFormatting) private var pasteWithFormatting: Bool = false
  @AppStorage(Constants.AppStorageKeys.clearSystemHistory) private var clearSystemHistory: Bool = false
  private var permissedAllowed: Bool { AXIsProcessTrustedWithOptions(nil) }

  var body: some View {
    VStack(spacing: 0) {
      Form {
        LaunchAtLogin.Toggle().toggleStyle(.switch)
        Divider().padding(.bottom, 8).padding(.top, 8)
        KeyboardShortcuts.Recorder("Open menu:", name: .openMenu)
        Divider().padding(.bottom, 8).padding(.top, 8)
        Toggle("Paste immediately", isOn: $pasteImmediately).toggleStyle(.switch)
        Toggle("Paste with formatting", isOn: $pasteWithFormatting).toggleStyle(.switch)
        Divider().padding(.bottom, 8).padding(.top, 8)
        Toggle("Delete system clipboard", isOn: $clearSystemHistory).toggleStyle(.switch)
        Text("Clear history will also delete system clipboard data.").font(.footnote)
        Spacer()
      }
      Divider()
      HStack {
        Image(systemName: "accessibility.fill")
          .foregroundColor(permissedAllowed ? .green : .red)
          .symbolRenderingMode(.hierarchical)
          .font(.largeTitle)
        VStack(alignment: .leading) {
          Text("Accessability permission \(accessText())")
          Text("Required to paste immediately, you will be prompted for this when pasting for the first time.")
            .font(.footnote)
        }.padding(.leading, 10)
      }.padding(.top, 10)
    }.padding(20)
  }

  private func accessText() -> String {
    return permissedAllowed ? "granted" : "not granted"
  }
}

#Preview {
  GeneralSettingsTabView()
}
