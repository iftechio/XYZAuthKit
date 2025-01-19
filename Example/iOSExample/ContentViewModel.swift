//
//  ContentViewModel.swift
//  iOSExample
//

import Foundation
import XYZAuthKit

let MyClientId = ""
let MyRedirectUri = ""

@MainActor
class ContentViewModel: ObservableObject {
    let version = XYZAuth.version

    @Published var isRegistered = false
    @Published var status: AuthorizeStatus = .idle
    @Published var isXYZInstalled: Bool?

    func registerApp() {
        XYZAuth.registerApp(MyClientId, redirectUri: MyRedirectUri)
        isRegistered = true
    }

    func checkXYZInstalled() {
        isXYZInstalled = XYZAuth.isAppInstalled()
    }

    func startAuthorize() {
        status = .authorizing
        XYZAuth.authorize { result in
            switch result {
            case let .success(code):
                self.status = .authSuccess(code)
            case let .failure(error):
                self.status = .authFailed(error)
            }
        }
    }
}


