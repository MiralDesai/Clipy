//
//  ClipManager.swift
//  Clipy
//
//  Created by Miral Desai on 15/12/2023.
//
import SwiftUI

class ClipManager {
  let clipRepository: ClipRepository

  init(clipRepository: ClipRepository = ClipRepository.init()) {
    self.clipRepository = clipRepository
  }

  func processChange() {
    let content = getStringFromClipboard()
    guard content != nil else { return }

    let clip = Clip()
    clip.content = content!
    clip.type = ClipType.string
    clip.createdAt = Date().unixTimestamp
    clip.updatedAt = Date().unixTimestamp

    clipRepository.upsert(clip)
  }

  private

  func getStringFromClipboard() -> Data? {
    guard let copiedString = NSPasteboard.general.string(forType: .string)?.data(using: .utf8)  else {
      return nil
    }
    return copiedString
  }
}
