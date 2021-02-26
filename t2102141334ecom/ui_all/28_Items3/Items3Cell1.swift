//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit


class Items3Cell1: UITableViewCell {

	@IBOutlet var imageProduct: UIImageView!
	@IBOutlet var buttonMore: UIButton!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelBrandName: UILabel!
	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var labelOriginalPrice: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		buttonMore.layer.borderWidth = 1
		buttonMore.layer.borderColor = AppColor.Border.cgColor
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: Int, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let brand = data["brand"] else { return }
		guard let price = data["price"] else { return }
		guard let originalPrice = data["originalPrice"] else { return }

//		imageProduct.sample("Ecommerce", "Clothes", index + 8)
        imageProduct.load_im(index+1)
        
		labelTitle.text = title
		labelBrandName.text = brand
		labelPrice.text = price
		labelOriginalPrice.text = originalPrice
		labelOriginalPrice.isHidden = (originalPrice == "")
	}
}
