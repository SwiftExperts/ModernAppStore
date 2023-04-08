//
//  Optional+SideEffects.swift
//  ModernAppStore
//
//  Created by geunsu.kim on 2023/04/08.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import Foundation

public extension Optional {
    
    func `do`(_ sideEffect: (Wrapped) -> Void) {
        switch self {
        case .some(let value):
            sideEffect(value)
        case .none:
            return
        }
    }
    
    func `do`(_ sideEffect: (Wrapped) async -> Void) async {
        switch self {
        case .some(let value):
            await sideEffect(value)
        case .none:
            return
        }
    }
    
}
