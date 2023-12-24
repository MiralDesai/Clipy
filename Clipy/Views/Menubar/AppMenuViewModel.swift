//
//  AppMenuViewModel.swift
//  Clipy
//
//  Created by Miral Desai on 08/12/2023.
//

import SwiftUI
import RealmSwift
import Combine

class AppMenuViewModel: ObservableObject {
  @Published var clips: [[Clip]] = []
  @Published var clipsUpdated: Bool = false
  private var cancellables: Set<AnyCancellable> = []
  let copyListener = CopyListener.shared()

  init() {
    sortClips(in: 10, clips: allClipboardItems())

    copyListener.$clipAdded.sink { [weak self] clipAdded in
      guard let self = self else { return }

      if clipAdded {
        self.sortClips(in: 10, clips: allClipboardItems())
        self.clipsUpdated = true
      }
    }.store(in: &cancellables)
  }

  func allClipboardItems() -> [Clip] {
    return ClipRepository().sortedByUpdatedAt().asArray()
  }

  func sortClips(in batches: Int, clips: [Clip]) {
    var sortedClips: [[Clip]] = []

    for batchIndex in 0..<(clips.count / batches + (clips.count % batches > 0 ? 1 : 0)) {
      let startIndex = batchIndex * batches
      let endIndex = Swift.min((batchIndex + 1) * batches, clips.count)

      let batch = Array(clips[startIndex..<endIndex])
      sortedClips.append(batch)
    }
    self.clips = sortedClips
  }

  func clipCounts(for batches: [[Clip]]) -> [String] {
    var totalCount = 0
    return batches.map { batch in
      let batchCount = batch.count
      guard batchCount > 0 else {
        return "No Clips"
      }

      let firstNumber = totalCount + 1
      let lastNumber = totalCount + batchCount
      totalCount += batchCount

      return "\(firstNumber)-\(lastNumber)"
    }
  }

  func clearClipboardHistory() {
    ClipRepository().deleteAll()
  }
}
