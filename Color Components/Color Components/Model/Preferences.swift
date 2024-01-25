//
//  Preferences.swift
//  Color Components
//
//  Created by Nader Alfares on 1/25/24.
//

import Foundation

enum Preferences: String, CaseIterable, Identifiable {
    case rectangle, circle
    var id : RawValue {rawValue}
}

