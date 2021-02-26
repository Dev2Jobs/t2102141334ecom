//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit
import Firebase
import NVActivityIndicatorView
//import NVActivityIndicatorViewExtended

//class Login1View: UIViewController {
class Login1View: UIViewController, NVActivityIndicatorViewable {
    
//    weak var delegate: LoginDelegate?

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageViewLogo: UIImageView!
	@IBOutlet var textFieldEmail: UITextField!
	@IBOutlet var textFieldPassword: UITextField!
	@IBOutlet var buttonHideShowPassword: UIButton!

    
	override func viewDidLoad() {
        ZmFunc().dlog("Login1View - viewDidLoad")

		super.viewDidLoad()
        
		textFieldEmail.setLeftPadding(value: 15)
		textFieldPassword.setLeftPadding(value: 15)
		textFieldPassword.setRightPadding(value: 40)

		loadData()
	}

	// MARK: - Data methods

	func loadData() {
        ZmFunc().dlog("Login1View - loadData")

		labelTitle.text = "Welcome to\nAppDesignKit"
		labelSubTitle.text = "An exciting place for the whole family to shop."
	}

	// MARK: - User actions

	@IBAction func actionHideShowPassword(_ sender: Any) {
        ZmFunc().dlog("Login1View - actionHideShowPassword")

		buttonHideShowPassword.isSelected = !buttonHideShowPassword.isSelected
		textFieldPassword.isSecureTextEntry = !buttonHideShowPassword.isSelected
	}

	@IBAction func actionLogin(_ sender: Any) {
        ZmFunc().dlog("Login1View - actionLogin")

        GFB_login(with: textFieldEmail.text!, password: textFieldPassword.text!)
    }

	@IBAction func actionForgotPassword(_ sender: Any) {
        ZmFunc().dlog("Login1View - actionForgotPassword")

//		print(#function)
//		dismiss(animated: true)
        
        self.move_home(2)
	}

	@IBAction func actionSignUp(_ sender: Any) {
        ZmFunc().dlog("Login1View - actionSignUp")
        
        move_sign(1)
	}
    
    func move_sign(_ temp_num: Int) {
        if ( 1 == temp_num ) {
            let signUp1View = SignUp1View()
            let navigation = NavigationController(rootViewController: signUp1View)
            navigation.isModalInPresentation = true
            navigation.navigationBar.isTranslucent = false
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }else if ( 2 == temp_num ) {
            let signUp2View = SignUp2View()
            let navigation = NavigationController(rootViewController: signUp2View)
            navigation.isModalInPresentation = true
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }
    }
    
    func move_home(_ temp_num: Int) {
        if ( 1 == temp_num ) {
            let home1View = Home1View()
            let navigation = NavigationController(rootViewController: home1View)
            navigation.isModalInPresentation = true
            navigation.navigationBar.isTranslucent = false
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }else if ( 2 == temp_num ) {
            let home2View = Home2View()
            let navigation = NavigationController(rootViewController: home2View)
            navigation.isModalInPresentation = true
            navigation.navigationBar.isTranslucent = false
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }else if ( 3 == temp_num ) {
            let home3View = Home3View()
            let navigation = NavigationController(rootViewController: home3View)
            navigation.isModalInPresentation = true
            navigation.navigationBar.isTranslucent = false
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }
    }
    
    func move_items(_ temp_num: Int) {
        if ( 3 == temp_num ) {
            let items3View = Items3View()
            let navigation = NavigationController(rootViewController: items3View)
            navigation.isModalInPresentation = true
            navigation.navigationBar.isTranslucent = false
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }else if ( 4 == temp_num ) {
            let items4View = Items4View()
            let navigation = NavigationController(rootViewController: items4View)
            navigation.isModalInPresentation = true
            navigation.navigationBar.isTranslucent = false
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }
    }
    
    // MARK: - Firebase 🔥
    
    private func GFB_login(with email: String, password: String) {
        ZmFunc().dlog("Firebase - GFB_login")
        
//        self.showSpinner(<#(() -> Void)?#>)
        
        let indicator = NVActivityIndicatorView(frame: CGRect(x: 162, y: 300, width: 50, height: 50),
                                                type: .ballGridPulse,
                                                color: .black,
                                                padding: 100)
        
        self.view.addSubview(indicator)
//        indicator.startAnimating()
        startAnimating(CGSize(width: 100, height: 100),message: "로딩중...",type: .ballGridPulse,color: .white)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
        }
        
//        indicator.isAnimating // 현재 애니메이션 상태인지 true, false 값으로 확인할 수도 있고요
        
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
        guard error == nil else { return self.displayError(error) }
//        self.delegate?.loginDidOccur()
            
//            print(result)
//            ZmFunc().dlog(result.debugDescription)
//            ZmFunc().dlog(result!.description)
            
//            self.hideSpinner()
            ZmFunc().dlog("Firebase - GFB_login - SUCCESS !!!")
            
//            NVActivityIndicatorPresenter.sharedInstance.setMessage("완료중...")
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
//                self.stopAnimating(nil)
//            }
            
//            indicator.stopAnimating()
            self.stopAnimating(nil)
            self.move_items(3)
        }
    }

    private func GFB_createUser(email: String, password: String) {
        ZmFunc().dlog("Firebase - GFB_createUser")
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        guard error == nil else { return self.displayError(error) }
//        self.delegate?.loginDidOccur()
        }
    }
}
