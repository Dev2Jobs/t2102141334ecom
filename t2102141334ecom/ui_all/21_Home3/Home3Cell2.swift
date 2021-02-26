//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit


class Home3Cell2: UICollectionViewCell {

	@IBOutlet var imageProduct: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelCompanyName: UILabel!
	@IBOutlet var labelDescription: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(index: IndexPath, data: [String: String]) {

		guard let title = data["title"] else { return }
		guard let companyName = data["companyName"] else { return }
		guard let description = data["description"] else { return }

//		imageProduct.sample("Ecommerce", "Shoes", index.row)
        imageProduct.load_im(index.row+1)
        
		labelTitle.text = title
		labelCompanyName.text = companyName
		labelDescription.text = description
	}
}
