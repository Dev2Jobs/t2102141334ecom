//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit


class Home2Cell2: UICollectionViewCell {

	@IBOutlet var labelCategory: UILabel!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(category: String) {

		labelCategory.text = category
	}
}
