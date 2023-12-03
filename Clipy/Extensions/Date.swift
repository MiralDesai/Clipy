//
//  Date.swift
//  Clipy
//
//  Created by Miral Desai on 02/12/2023.
//

import Foundation

typealias UnixTimestamp = Int

extension Date {
  /// Date to Unix timestamp.
  var unixTimestamp: UnixTimestamp {
    return UnixTimestamp(self.timeIntervalSince1970 * 1_000) // millisecond precision
  }
}

extension UnixTimestamp {
  /// Unix timestamp to date.
  var date: Date {
    return Date(timeIntervalSince1970: TimeInterval(self / 1_000)) // must take a millisecond-precise Unix timestamp
  }
}
