//
//  AppearanceSettingsTabView.swift
//  Clipy
//
//  Created by Miral Desai on 25/11/2023.
//

import SwiftUI

struct AppearanceSettingsTabView: View {
  @AppStorage("showPreview") private var showPreview = true
  @AppStorage("fontSize") private var fontSize = 12.0

  var body: some View {
    Form {
      Toggle("Show Previews", isOn: $showPreview)
      Slider(value: $fontSize, in: 9...96) {
        Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
      }
    }.padding(20)
  }
}

#Preview {
  AppearanceSettingsTabView()
}
