//
//  SettingsView.swift
//  Clipy
//
//  Created by Miral Desai on 24/11/2023.
//

import SwiftUI

struct SettingsView: View {
  private enum Tabs: Hashable {
    case general, appearence
  }
  var body: some View {
    TabView {
      GeneralSettingsTabView()
        .tabItem { Label("General", systemImage: "gear") }
        .tag(Tabs.general)
      AppearanceSettingsTabView()
        .tabItem { Label("Appearance", systemImage: "paintpalette") }
        .tag(Tabs.appearence)
      AboutView()
        .tabItem { Label("About", systemImage: "info.circle.fill") }
        .tag(Tabs.appearence)
    }
    .frame(minWidth: 500)
    .animation(Animation
      .easeInOut(duration: 1.5)
      .repeatForever(autoreverses: true), value: UUID())
  }
}

#Preview {
  SettingsView()
}
