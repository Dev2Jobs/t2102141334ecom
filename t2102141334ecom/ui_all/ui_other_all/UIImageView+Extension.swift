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
import Kingfisher

//-------------------------------------------------------------------------------------------------------------------------------------------------
extension UIImageView {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func sample(_ topic: String, _ subtopic: String, _ index: Int) {

		KingfisherManager.shared.downloader.downloadTimeout = 600
		let processor = DownsamplingImageProcessor(size: self.frame.size)
		let options: KingfisherOptionsInfo = [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(0.5)), .downloadPriority(1.0)]

		let url = URL(string: String(format: "https://relatedcode.com/pics/\(topic)/\(subtopic)/%02d.jpg", index+1))

		let size = CGSize(width: 1, height: 1)
		let placeholder = UIGraphicsImageRenderer(size: size).image { rendererContext in
			UIColor.lightGray.setFill()
			rendererContext.fill(CGRect(origin: .zero, size: size))
		}

		self.kf.setImage(with: url, placeholder: placeholder, options: options)
	}
    
//    func load_im(_ topic: String, _ subtopic: String, _ index: Int) {
    func load_im(_ index: Int) {

        KingfisherManager.shared.downloader.downloadTimeout = 600
        let processor = DownsamplingImageProcessor(size: self.frame.size)
        let options: KingfisherOptionsInfo = [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(0.5)), .downloadPriority(1.0)]

//        let url = URL(string: String(format: "https://relatedcode.com/pics/\(topic)/\(subtopic)/%02d.jpg", index+1))
        let url = URL(string: String(format:"https://storage.googleapis.com/firestorequickstarts.appspot.com/food_\(index).png"))
        
        ZmFunc().dlog("Firebase - load_im \(index) - \(url)")

        let size = CGSize(width: 1, height: 1)
        let placeholder = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.lightGray.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        self.kf.setImage(with: url, placeholder: placeholder, options: options)
    }
}
