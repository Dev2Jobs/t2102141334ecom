//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit
import Firebase


//@objc(SignUp1View)
class SignUp1View: UIViewController {

	@IBOutlet var textFieldFirstName: UITextField!
	@IBOutlet var textFieldLastName: UITextField!
	@IBOutlet var textFieldEmail: UITextField!
	@IBOutlet var textFieldPassword: UITextField!
	@IBOutlet var textFieldPassword2: UITextField!

    
	override func viewDidLoad() {
        ZmF().dlog("SignUp1View - viewDidLoad")

		super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		navigationItem.titleView = UIImageView(image: UIImage(systemName: "circle.grid.hex.fill"))

		textFieldFirstName.setLeftPadding(value: 15)
		textFieldLastName.setLeftPadding(value: 15)
		textFieldEmail.setLeftPadding(value: 15)
		textFieldPassword.setLeftPadding(value: 15)
		textFieldPassword2.setLeftPadding(value: 15)
	}

	// MARK: - User actions

	@IBAction func actionFacebook(_ sender: Any) {
        ZmF().dlog("SignUp1View - actionFacebook")

		print(#function)
		dismiss(animated: true)
	}

	@IBAction func actionContinue(_ sender: Any) {
        ZmF().dlog("SignUp1View - actionContinue")

//		print(#function)
//		dismiss(animated: true)
        
        ZmF().dlog(textFieldFirstName.text!)
        ZmF().dlog(textFieldLastName.text!)
        ZmF().dlog(textFieldEmail.text!)
        ZmF().dlog(textFieldPassword.text!)
        ZmF().dlog(textFieldPassword2.text!)
    
        GFB_createUser(email: textFieldEmail.text!, password: textFieldPassword.text!)

/*
        Auth.auth().createUser(withEmail: textFieldEmail.text!, password: textFieldPassword.text!) { authResult, error in
          guard error == nil else { return self.displayError(error) }
//          self.delegate?.loginDidOccur()
        }
*/
 /*
//        guard let strongSelf = self else { return }
        
        showTextInputPrompt(withMessage: "Email:") {  [weak self] userPressedOK, email in
          guard let strongSelf = self else { return }
          guard let email = email else {
            strongSelf.showMessagePrompt("email can't be empty")
            return
          }
          strongSelf.showTextInputPrompt(withMessage: "Password:") { userPressedOK, password in
            guard let password = password else {
              strongSelf.showMessagePrompt("password can't be empty")
              return
            }
            strongSelf.showSpinner {
            // [START create_user]
            Auth.auth().createUser(withEmail: textFieldEmail, password: textFieldPassword) { authResult, error in
            // [START_EXCLUDE]
                self.hideSpinner() {
                    guard let user = authResult?.user, error == nil else {
                        self.showMessagePrompt(error!.localizedDescription)
                        return
                    }
              
//                    print("\(user.email!) created")
                    strongSelf.navigationController?.popViewController(animated: true)
                }
            
                // [END_EXCLUDE]
            }
          
            // [END create_user]
        }
*/
	}

	@IBAction func actionTerms(_ sender: Any) {
        ZmF().dlog("SignUp1View - actionTerms")

		print(#function)
		dismiss(animated: true)
	}

	@IBAction func actionPrivacy(_ sender: Any) {
        ZmF().dlog("SignUp1View - actionPrivacy")

		print(#function)
		dismiss(animated: true)
	}
    
    // MARK: - Firebase 🔥
    
    private func GFB_login(with email: String, password: String) {
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
        guard error == nil else { return self.displayError(error) }
//        self.delegate?.loginDidOccur()
      }
    }

    private func GFB_createUser(email: String, password: String) {
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        guard error == nil else { return self.displayError(error) }
//        self.delegate?.loginDidOccur()
      }
    }
}
