/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A simple struct that defines the service and access group to be used by the sample apps.
    https://developer.apple.com/library/content/samplecode/GenericKeychain/Introduction/Intro.html
*/

// 使用例子

// 存

//var accountName: String?
//
//func save() {
//    guard let newAccountName = username.text, let newPassword = password.text, !newAccountName.isEmpty && !newPassword.isEmpty else { return }
//    do {
//        if let originalAccountName = accountName {
//            // Create a keychain item with the original account name.
//            var passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: originalAccountName, accessGroup: KeychainConfiguration.accessGroup)
//
//            // Update the account name and password.
//            try passwordItem.renameAccount(newAccountName)
//            try passwordItem.savePassword(newPassword)
//        }
//        else {
//            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: newAccountName, accessGroup: KeychainConfiguration.accessGroup)
//
//            // Save the password for the new item.
//            try passwordItem.savePassword(newPassword)
//        }
//    }
//    catch {
//        fatalError("Error updating keychain - \(error)")
//    }
//}

// 读

//do {
//    passwordItems = try KeychainPasswordItem.passwordItems(forService: KeychainConfiguration.serviceName, accessGroup: KeychainConfiguration.accessGroup)
//    if passwordItems.count > 0 {
//        accountName = passwordItems[0].account
//        username.text = accountName
//        password.text = try passwordItems[0].readPassword()
//    }
//}
//catch {
//    fatalError("Error fetching password items - \(error)")
//}

import Foundation

struct KeychainConfiguration {
    static let serviceName = "MyAppService"
    
    /*
        Specifying an access group to use with `KeychainPasswordItem` instances
        will create items shared accross both apps.
    
        For information on App ID prefixes, see:
            https://developer.apple.com/library/ios/documentation/General/Conceptual/DevPedia-CocoaCore/AppID.html
        and:
            https://developer.apple.com/library/ios/technotes/tn2311/_index.html
    */
//    static let accessGroup = "[YOUR APP ID PREFIX].com.example.apple-samplecode.GenericKeychainShared"

    /*
        Not specifying an access group to use with `KeychainPasswordItem` instances
        will create items specific to each app.
    */
    static let accessGroup: String? = nil
}
