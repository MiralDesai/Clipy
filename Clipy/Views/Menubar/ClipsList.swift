//
//  ClipsList.swift
//  Clipy
//
//  Created by Miral Desai on 12/12/2023.
//

import SwiftUI

struct ClipsList: View {
  var clips: [Clip]

  var body: some View {
    ForEach(clips, id: \.self) { clip in
      ClipRow(clip: clip)
    }
  }
}
