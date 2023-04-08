//
//  Optional+Unwrap.swift
//  NetworkClient
//
//  Created by geunsu.kim on 2023/04/08.
//  Copyright © 2023 com.devkimmy. All rights reserved.
//

import Foundation

public extension Optional {
    
    func unwrap(`default`: Wrapped) -> Wrapped {
        guard case .some(let wrapped) = self else {
            return `default`
        }
        return wrapped
    }
    
    func unwrapForced() -> Wrapped {
        guard case .some(let wrapped) = self else {
            fatalError("Force Unwrapping Failed.")
        }
        return wrapped
    }
    
}
