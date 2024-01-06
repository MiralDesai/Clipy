//
//  GeneralSettingsTabView.swift
//  Clipy
//
//  Created by Miral Desai on 24/11/2023.
//

import SwiftUI
import KeyboardShortcuts

struct GeneralSettingsTabView: View {
    var body: some View {
      Form {
        KeyboardShortcuts.Recorder("Open menu:", name: .openMenu)
      }
    }
}

#Preview {
    GeneralSettingsTabView()
}
