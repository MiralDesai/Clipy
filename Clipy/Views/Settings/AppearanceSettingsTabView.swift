//
//  AppearanceSettingsTabView.swift
//  Clipy
//
//  Created by Miral Desai on 25/11/2023.
//

import SwiftUI

struct AppearanceSettingsTabView: View {
  @AppStorage(Constants.AppStorageKeys.menuBarIcon) var menuBarIcon = "clipboard"

  var body: some View {
    VStack(spacing: 0) {
      Form {
        Picker("Menu bar icon:", selection: $menuBarIcon) {
          ForEach(Constants.MenuBar.iconList, id: \.self) {
            Image(systemName: $0)
          }
        }.frame(maxWidth: 150)
        Text("Requires application restart for changes to take affect").font(.footnote)
      }
    }.padding(20)
  }
}

#Preview {
  AppearanceSettingsTabView()
}
