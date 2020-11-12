//
//  BaseVM.swift
//  Alamofire
//
//  Created by Ajie Pramono Arganata on 23/01/20.
//

open class BaseVM: NSObject {
    public var loadError = Observable<String>()
    public var loadExpiredToken = Observable<Bool>()
    public var loadApi = Observable<Bool>()
}
