//
//  GeneralSettingsTabView.swift
//  Clipy
//
//  Created by Miral Desai on 24/11/2023.
//

import SwiftUI
import KeyboardShortcuts

struct GeneralSettingsTabView: View {
  @AppStorage(Constants.AppStorageKeys.pasteImmediately) private var pasteImmediately: Bool = true
  @AppStorage(Constants.AppStorageKeys.pasteWithFormatting) private var pasteWithFormatting: Bool = false
  private var permissedAllowed: Bool { AXIsProcessTrustedWithOptions(nil) }

  var body: some View {
    NavigationStack {
      VStack(alignment: .leading) {
        Form {
          KeyboardShortcuts.Recorder("Open menu:", name: .openMenu)
        }
        Divider()
        Toggle(isOn: $pasteImmediately) {
          Text("Paste immediately")
          Text("some descriptions about this toggle")
        }.toggleStyle(.switch).controlSize(.mini)
        Toggle(isOn: $pasteWithFormatting) {
          Text("Paste with formatting")
        }.toggleStyle(.switch).controlSize(.mini)
        Divider()
        HStack {
          Image(systemName: "accessibility.fill")
            .foregroundColor(.red)
            .symbolRenderingMode(.hierarchical)
            .font(.system(size: 30))
          Text("Your account")
        }
      }.padding()
    }
  }
}

#Preview {
  GeneralSettingsTabView()
}
