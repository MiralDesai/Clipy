//
//  String.swift
//  Clipy
//
//  Created by Miral Desai on 08/12/2023.
//

extension String {
  func truncate(length: Int, trailing: String = "…") -> String {
    let maxLength = length - trailing.count
    guard maxLength > 0, !self.isEmpty, self.count > length else {
      return self
    }
    return self.prefix(maxLength) + trailing
  }
}
