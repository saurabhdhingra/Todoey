//
//  OffsetKey.swift
//  Bucket List
//
//  Created by Saurabh Dhingra on 10/10/24.
//


import SwiftUI

struct OffsetKey: PreferenceKey {
    typealias Value = CGFloat
    
    static var defaultValue: Value = 0
    static func reduce(value: inout Value, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
