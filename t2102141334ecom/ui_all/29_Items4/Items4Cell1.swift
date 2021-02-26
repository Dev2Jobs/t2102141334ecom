//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit


class Items4Cell1: UITableViewCell {

	@IBOutlet var imageProduct: UIImageView!
	@IBOutlet var labelSale: UILabel!
	@IBOutlet var buttonFavorite: UIButton!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelBrandName: UILabel!
	@IBOutlet var labelPrice: UILabel!
	@IBOutlet var labelOriginalPrice: UILabel!
	@IBOutlet var labelItems: UILabel!
	@IBOutlet var buttonAddItem: UIButton!
	@IBOutlet var buttonRemoveItem: UIButton!
	@IBOutlet var viewCart: UIView!
	@IBOutlet var buttonCart: UIButton!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func awakeFromNib() {

		super.awakeFromNib()
		labelSale.layer.borderWidth = 1
		labelSale.layer.borderColor = AppColor.Border.cgColor

		buttonFavorite.layer.borderWidth = 1
		buttonFavorite.layer.borderColor = AppColor.Border.cgColor

		viewCart.layer.borderWidth = 1
		viewCart.layer.borderColor = AppColor.Border.cgColor
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let brand = data["brand"] else { return }
		guard let price = data["price"] else { return }
		guard let originalPrice = data["originalPrice"] else { return }
		guard let items = data["items"] else { return }

//		imageProduct.sample("Ecommerce", "Bags", index.row+17)
        imageProduct.load_im(index.row+1)
        
		labelTitle.text = title
		labelBrandName.text = brand
		labelPrice.text = price
		labelOriginalPrice.text = originalPrice
		labelSale.isHidden = (originalPrice == "")
		labelOriginalPrice.isHidden = (originalPrice == "")
		labelItems.text = items
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionAddItem(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionRemoveItem(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionFavorite(_ sender: UIButton) {

		print(#function)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionCart(_ sender: UIButton) {

		print(#function)
	}
}
