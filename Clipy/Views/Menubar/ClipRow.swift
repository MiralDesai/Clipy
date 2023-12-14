//
//  ClipRow.swift
//  Clipy
//
//  Created by Miral Desai on 12/12/2023.
//

import SwiftUI

struct ClipRow: View {
  var clip: Clip

  var body: some View {
    Button {
      print("Clip selected: \(clip.updatedAt)")
    } label: {
      Text(String(data: clip.content, encoding: .utf8)!.truncate(length: 30))
    }
  }
}
