//
//  ZmVar.swift
//  test210120
//
//  Created by soul on 2021/02/10.
//

//import Foundation

class ZmVar {
//    싱글톤 객체를 이용하여 접근할 전역 변수 선언
    public var globalstring:String = "gl test"
    
    struct staticInstance {
        static var instance:ZmVar?
    }
    
//    싱글톤 객체를 반환하는 함수 sharedInstance
    class func sh()->ZmVar {
        if (nil == staticInstance.instance) {
            staticInstance.instance = ZmVar()
        }
        
        return staticInstance.instance!
    }
    
    enum SceneNum {
        case SC_H1V
        case SC_H2V
        case SC_H3V
        case SC_L1V
    }
}

// ZmVar.sharedInstance().globalstring
