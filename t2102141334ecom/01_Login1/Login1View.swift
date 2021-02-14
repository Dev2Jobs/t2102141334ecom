//
// Copyright (c) 2020 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

//-------------------------------------------------------------------------------------------------------------------------------------------------
class Login1View: UIViewController {

	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelSubTitle: UILabel!
	@IBOutlet var imageViewLogo: UIImageView!
	@IBOutlet var textFieldEmail: UITextField!
	@IBOutlet var textFieldPassword: UITextField!
	@IBOutlet var buttonHideShowPassword: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {
        ZmFunc().dlog("Login1View - viewDidLoad")

		super.viewDidLoad()

        if (nil == textFieldEmail) {
            ZmFunc().dlog("AppDelegate  - textFieldEmail - error")
        }else {
            ZmFunc().dlog("AppDelegate - textFieldEmail - yes")
        }
        
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

		print(#function)
		dismiss(animated: true)
	}
}
