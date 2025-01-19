//
//  AuthorizeStatus.swift
//  iOSExample
//

import XYZAuthKit

enum AuthorizeStatus: Equatable {
    case idle
    case authorizing
    case authSuccess(String)
    case authFailed(XYZAuthError)
}
