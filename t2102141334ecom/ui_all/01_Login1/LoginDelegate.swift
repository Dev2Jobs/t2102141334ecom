//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import Foundation

/// Delegate for signaling that a successful login with Firebase Auth has occurred
protocol LoginDelegate: NSObject {
  func loginDidOccur()
}
