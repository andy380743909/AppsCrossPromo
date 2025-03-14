//
//  AppInfo.swift
//  
//
//  Created by cuipanjun on 2025/3/13.
//


import Foundation

@objcMembers
public class AppInfo: NSObject {
    public let AppID: Int64
    public let name: String
    public let subtitle: String
    public let iconName: String
    public let appStoreLink: String

    public init(AppID: Int64, name: String, subtitle: String, iconName: String, appStoreLink: String) {
        self.AppID = AppID
        self.name = name
        self.subtitle = subtitle
        self.iconName = iconName
        self.appStoreLink = appStoreLink
    }
}
