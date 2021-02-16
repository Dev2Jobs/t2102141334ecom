//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit


class Login1View: UIViewController {

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

		print(#function)
		dismiss(animated: true)
	}

	@IBAction func actionForgotPassword(_ sender: Any) {
        ZmFunc().dlog("Login1View - actionForgotPassword")

		print(#function)
		dismiss(animated: true)
	}

	@IBAction func actionSignUp(_ sender: Any) {
        ZmFunc().dlog("Login1View - actionSignUp")

//		print(#function)
//		dismiss(animated: true)
        
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
}
