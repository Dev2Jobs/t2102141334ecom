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
//import SDWebImage
//import FirebaseStorage
import Firebase
import FirebaseUI

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
/*
    func setProfileImageView(userId:String) {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "HogeHoge.com")
        let profileimagesRef = storageRef.child("profileimages")
        let imagesChildRef = profileimagesRef.child("\(userId)" + "profile.png")
        let placeholderImage = UIImage(named: "avatar")
        self.sd_setImage(with: imagesChildRef, placeholderImage: placeholderImage)
        print("function is working fine, but the image is not downloaded")
    }

    func storageFidsfdfs() {
        // Reference to an image file in Cloud Storage
        let reference: StorageReference = Storage.storage().reference()

        // UIImageView in your ViewController
//        let imageView: UIImageView = ...

        // Load the image using SDWebImage
//        self.sd_setImage(with: reference, placeholderImage: placeholderImage)

        // Use gs:// URL directly with StorageImageLoader
        let storageUrl = URL(string: "gs://fb-test-210209.appspot.com/food_s/food_1.png")
        self.sd_setImage(with: storageUrl, placeholderImage: placeholderImage, options:[], context: [.imageLoader : StorageImageLoader.shared])

        // Use progressive downloading and decoding for images
//        self.sd_setImage(with: reference, placeholderImage: placeholderImage, options: [.progressiveLoad])
        
        self.sd_setImage(with: StorageReference().child("food_s/food_1.png"), placeholderImage: #imageLiteral(resourceName: "image")) { (image, error, cacheType, storageReference) in
             print(storageReference) // gs://project-name.appspot.com/itemsImages/2263.0-1907.0-1530054884661.jpg
             print(error) // Optional(Error Domain=FIRStorageErrorDomain Code=-13040 "User cancelled the upload/download." UserInfo={NSLocalizedDescription=User cancelled the upload/download.})
        }
    }
*/
    /*
//        gs://fb-test-210209.appspot.com/food_s/food_1.png
    func storageFirebaseUIExample() {
        // Get a non-default Cloud Storage bucket
        let storage = Storage.storage(url:"gs://fb-test-210209.appspot.com")
        
        let reference = Storage.storage(url:"gs://fb-test-210209.appspot.com").reference(withPath: "food_s/food_1.png")
//        let imageView: UIImageView = self.imageView
//        self.sd_setImage(with: reference)
        
        reference.downloadURL(completion: <#T##(URL?, Error?) -> Void#>)
        
        self.sd_setImage(with: reference, completed: <#T##SDExternalCompletionBlock?##SDExternalCompletionBlock?##(UIImage?, Error?, SDImageCacheType, URL?) -> Void#>)
    }
    
    func storageFirebaseUIExample333() {
      let storageRef = Storage.storage().reference()

      // [START firstorage_firebaseui]
      // Reference to an image file in Firebase Storage
      let reference = storageRef.child("images/stars.jpg")

      // UIImageView in your ViewController
//      let imageView: UIImageView = self.imageView
//        let imageView: UIImageView = self

      // Placeholder image
      let placeholderImage = UIImage(named: "placeholder.jpg")

      // Load the image using SDWebImage
      self.sd_setImage(with: reference, placeholderImage: placeholderImage)
      // [END firstorage_firebaseui]
    }
    
    func storageFirebaseUIExample22() {
      let storageRef = Storage.storage().reference()

      // [START firstorage_firebaseui]
      // Reference to an image file in Firebase Storage
      let reference = storageRef.child("images/stars.jpg")

      // UIImageView in your ViewController
//      let imageView: UIImageView = self.imageView

      // Placeholder image
      let placeholderImage = UIImage(named: "placeholder.jpg")

      // Load the image using SDWebImage
//      imageView.sd_setImage(with: reference, placeholderImage: placeholderImage)
        self.sd_setImage(with: reference, placeholderImage: placeholderImage)
      // [END firstorage_firebaseui]
    }
*/
//        gs://fb-test-210209.appspot.com/food_s/food_1.png
    func load_im(_ index: Int) {
        ZmF().dlog("load_im - index: \(index) - ZmV.sh().rt_im_st[\(index) ]: \(ZmV.sh().rt_im_st[index-1])")
        
        load_im_sd(index-1)
    }
    
    func load_im_sd(_ index: Int) {
        // Reference to an image file in Firebase Storage
        let storageRef = Storage.storage().reference()
//        let reference = storageRef.child("food_s/food_\(index%3+1).png")
        let reference = storageRef.child(ZmV.sh().rt_im_st[index])
        
        // UIImageView in your ViewController
//        let imageView: UIImageView = self.imageView

        // Placeholder image
//        let placeholderImage = UIImage(named: "placeholder.jpg")
        let placeholderImage = UIImage(named: "ph_empty.png")

        // Load the image using SDWebImage
        self.sd_setImage(with: reference, placeholderImage: placeholderImage)
    }
    
    func load_im333(_ index: Int) {

        KingfisherManager.shared.downloader.downloadTimeout = 600
        let processor = DownsamplingImageProcessor(size: self.frame.size)
        let options: KingfisherOptionsInfo = [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(0.5)), .downloadPriority(1.0)]

//        let url = URL(string: String(format: "https://relatedcode.com/pics/\(topic)/\(subtopic)/%02d.jpg", index+1))
//        let url = URL(string: String(format:"https://storage.googleapis.com/firestorequickstarts.appspot.com/food_\(index).png"))
        let url = URL(string: String(format:"https://fb-test-210209.appspot.com/food_s/food_1.png"))
//        gs://fb-test-210209.appspot.com/food_s/food_1.png
        
//        let temp_str = String(format:"https://storage.googleapis.com/firestorequickstarts.appspot.com/food_\(index).png")
//        ZmF().dlog("Kingfisher - load_im \(index) - \(temp_str)")

        let size = CGSize(width: 1, height: 1)
        let placeholder = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.lightGray.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        self.kf.setImage(with: url, placeholder: placeholder, options: options)
    }
    
//    func load_im(_ topic: String, _ subtopic: String, _ index: Int) {
    func load_im_kf(_ index: Int) {
        KingfisherManager.shared.downloader.downloadTimeout = 600
        let processor = DownsamplingImageProcessor(size: self.frame.size)
        let options: KingfisherOptionsInfo = [.processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(0.5)), .downloadPriority(1.0)]

//        let url = URL(string: String(format: "https://relatedcode.com/pics/\(topic)/\(subtopic)/%02d.jpg", index+1))
        let url = URL(string: String(format:"https://storage.googleapis.com/firestorequickstarts.appspot.com/food_\(index).png"))
        
//        let temp_str = String(format:"https://storage.googleapis.com/firestorequickstarts.appspot.com/food_\(index).png")
//        ZmF().dlog("Kingfisher - load_im \(index) - \(temp_str)")

        let size = CGSize(width: 1, height: 1)
        let placeholder = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.lightGray.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        self.kf.setImage(with: url, placeholder: placeholder, options: options)
    }
}
