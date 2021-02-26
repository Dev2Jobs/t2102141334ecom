//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit


class Home1Cell2: UICollectionViewCell {

	@IBOutlet var imageProduct: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

//		guard let images = data["images"] else { return }
		guard let title = data["title"] else { return }
		guard let description = data["description"] else { return }

//		imageProduct.sample("Ecommerce", images, index)
        imageProduct.load_im(index+1)
        
		labelTitle.text = title
		labelDescription.text = description
	}
}
