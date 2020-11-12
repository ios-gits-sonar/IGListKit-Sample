//
//  Observable.swift
//  HelperModule
//
//  Created by Ajie Pramono Arganata on 29/11/19.
//  Copyright © 2019 Ajie Pramono Arganata. All rights reserved.
//

import Foundation

open class Observable<T: Equatable> {
    private let thread : DispatchQueue
    public var property : T? {
        willSet(newValue) {
            if let newValue = newValue,  property != newValue {
                thread.async {
                    self.observe?(newValue)
                }
            }
        }
    }
    public var observe : ((T) -> ())?
    public init(_ value: T? = nil, thread dispatcherThread: DispatchQueue =     DispatchQueue.main) {
        self.thread = dispatcherThread
        self.property = value
    }
}
