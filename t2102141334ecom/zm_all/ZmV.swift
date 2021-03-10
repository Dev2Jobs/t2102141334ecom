//
//  ZmV.swift
//  test210120
//
//  Created by soul on 2021/02/10.
//

//import Foundation

class ZmV {
//    싱글톤 객체를 이용하여 접근할 전역 변수 선언
    public var globalstring:String = "gl test"
    
    public var rt_im_st:[String]  = ["","","","","","","","","","","","","","","","","","","",""]
    
    struct staticInstance {
        static var instance:ZmV?
    }
    
//    init(_ index: Int) {
//        for ii in 0 ..< 20 {
//            rt_im_st[ii] = "food_s/food_3.png" // food_s/food_\(ii%3+1).png
//        }
//    }
    
//    싱글톤 객체를 반환하는 함수 sharedInstance
    class func sh()->ZmV {
        if (nil == staticInstance.instance) {
            staticInstance.instance = ZmV()
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

// ZmV.sharedInstance().globalstring
