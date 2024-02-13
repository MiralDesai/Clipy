//
//  ClipManager.swift
//  Clipy
//
//  Created by Miral Desai on 15/12/2023.
//
import SwiftUI

class ClipManager {
  let clipRepository: ClipRepository
  let pasteboard: NSPasteboard

  init(clipRepository: ClipRepository = ClipRepository.init()) {
    self.clipRepository = clipRepository
    self.pasteboard = NSPasteboard.general
  }

  func processChange() {
    guard let data = getDataFromClipboard() else { return }

    let existingClip = clipRepository.findByContent(content: data.content)
    if let existingClip = existingClip {
      clipRepository.refreshUpdatedAt(existingClip)
    } else {
      createClip(data.content, data.type)
    }
  }

  private

  func getDataFromClipboard() -> (content: Data, type: NSPasteboard.PasteboardType)? {
    guard let type = supportedType(), let data = pasteboard.data(forType: type) else { return nil }

    return (data, type)
  }

  func supportedType() -> NSPasteboard.PasteboardType? {
    pasteboard.types?.first(where: { Clip.supportedTypes.contains($0) })
  }

  func createClip(_ content: Data, _ type: NSPasteboard.PasteboardType) {
    let clip = Clip()
    clip.content = content
    clip.type = ClipType(rawValue: type.rawValue)!
    clip.createdAt = Date().unixTimestamp
    clip.updatedAt = Date().unixTimestamp

    clipRepository.upsert(clip)
  }
}
