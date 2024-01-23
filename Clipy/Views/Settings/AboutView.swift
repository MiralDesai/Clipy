//
//  AboutView.swift
//  Clipy
//
//  Created by Miral Desai on 21/01/2024.
//
import SwiftUI

struct AboutView: View {
  var body: some View {
    VStack {
      Image(nsImage: NSImage(named: "AppIcon") ?? NSImage())
      Text(Bundle.main.appName)
        .font(.largeTitle)
      Text("Version: \(Bundle.main.appVersion) (\(Bundle.main.appBuild)) ")
        .font(.subheadline)
        .multilineTextAlignment(.center)
    }.padding()
  }
}

#Preview {
  AppearanceSettingsTabView()
}
