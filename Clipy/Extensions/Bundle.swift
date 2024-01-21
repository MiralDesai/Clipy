//
//  Bundle.swift
//  Clipy
//
//  Created by Miral Desai on 21/01/2024.
//
import Foundation

extension Bundle {
  public var appName: String { getInfo("CFBundleName") }
  public var appBuild: String { getInfo("CFBundleVersion") }
  public var appVersion: String { getInfo("CFBundleShortVersionString") }
  public var language: String { getInfo("CFBundleDevelopmentRegion") }
  public var identifier: String { getInfo("CFBundleIdentifier") }

  fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "⚠️" }
}
