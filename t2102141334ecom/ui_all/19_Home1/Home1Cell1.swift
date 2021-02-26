//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit


class Home1Cell1: UICollectionViewCell {

	@IBOutlet var imageSlider: UIImageView!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int) {

//		imageSlider.sample("Ecommerce", "Candles", index)
        imageSlider.load_im(index+1)
	}
}
