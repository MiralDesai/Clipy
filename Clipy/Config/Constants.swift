//
//  Constants.swift
//  Clipy
//
//  Created by Miral Desai on 09/01/2024.
//

enum Constants {
  enum AppStorageKeys {
    static let pasteImmediately = "paste_immediately"
    static let pasteWithFormatting = "paste_with_formatting"
    static let menuBarIcon = "menu_bar_icon"
    static let clearSystemHistory = "clear_system_pasteboard"
  }

  enum MenuBar {
    static let iconList = [
      "clipboard", "clipboard.fill", "list.bullet.clipboard",
      "list.bullet.clipboard.fill", "list.clipboard",
      "list.clipboard.fill", "paperclip", "paperclip.circle",
      "paperclip.circle.fill", "doc.on.doc", "doc.on.doc.fill"
    ]
  }
}
