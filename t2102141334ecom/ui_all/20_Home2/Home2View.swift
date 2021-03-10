//
//  t2102141334ecom
//
//  Created by soul on 2021/02/14.
//

import UIKit
import Firebase
//import FirebaseFirestoreSwift


class Home2View: UIViewController {

	@IBOutlet var viewTitle: UIView!
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var viewProfile: UIView!
	@IBOutlet var imageViewProfile: UIImageView!
	@IBOutlet var collectionViewSlider: UICollectionView!
	@IBOutlet var collectionViewCategories: UICollectionView!
	@IBOutlet var layoutConstraintCategoriesHeight: NSLayoutConstraint!
	@IBOutlet var collectionViewDiscounts: UICollectionView!
	@IBOutlet var layoutConstraintDiscountsHeight: NSLayoutConstraint!

    var num_col_v_slr: Int = 10
    var num_col_v_ctg: Int = 4
    var num_col_v_dis: Int = 4 // 6 // 0
    
	private var sliderVisibleIndex = IndexPath(item: 0, section: 0)
	private var categories: [String] = []
	private var products: [[String: String]] = []

    private var documents: [DocumentSnapshot] = []
    var restaurants: [Restaurant] = []
	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewDidLoad() {
        print("Home2View - viewDidLoad")

		super.viewDidLoad()

        self.get_exam_db_all()
        
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewTitle)
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewProfile)

		collectionViewSlider.register(UINib(nibName: "Home2Cell1", bundle: Bundle.main), forCellWithReuseIdentifier: "Home2Cell1")
		collectionViewCategories.register(UINib(nibName: "Home2Cell2", bundle: Bundle.main), forCellWithReuseIdentifier: "Home2Cell2")
		collectionViewDiscounts.register(UINib(nibName: "Home2Cell3", bundle: Bundle.main), forCellWithReuseIdentifier: "Home2Cell3")

		let cellWidth = UIScreen.main.bounds.width - 100
		let sectionSpacing = CGFloat(50)
		let cellSpacing = CGFloat(15)

		if let layout = collectionViewSlider.collectionViewLayout as? Home2PagingCollectionViewLayout {
			layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpacing, bottom: 0, right: sectionSpacing)
			layout.itemSize = CGSize(width: cellWidth, height: collectionViewSlider.frame.size.height)
			layout.minimumLineSpacing = cellSpacing
			collectionViewSlider.collectionViewLayout = layout
			collectionViewSlider.translatesAutoresizingMaskIntoConstraints = false
			collectionViewSlider.decelerationRate = .fast
		}

		loadData()
        
        self.listenDocument()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	override func viewWillLayoutSubviews() {

		super.viewWillLayoutSubviews()

		layoutConstraintCategoriesHeight.constant = collectionViewCategories.contentSize.height
		layoutConstraintDiscountsHeight.constant = collectionViewDiscounts.contentSize.height
	}

	// MARK: - Data methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
    func listenDocument() {
        ZmF().dlog("Home2View - listenDocument")
            // [START listen_document]
        
        Firestore.firestore().collection("restaurants").addSnapshotListener { documentSnapshot, error in
//        Firestore.firestore().collection("restaurants").document("").addSnapshotListener { documentSnapshot, error in
            guard documentSnapshot != nil else {
                print("Error fetching document: \(error!)")
                return
            }
//            guard let document = documentSnapshot else {
//                print("Error fetching document: \(error!)")
//                return
//            }
                    
//            guard let data = document.data() else {
//                print("Document data was empty.")
//                return
//            }
//            print("Current data: \(data)")
            self.get_exam_db_all()
        }
            // [END listen_document]
    }
    
    func get_exam_db_all() {
        ZmF().dlog("Home2View - get_exam_db_all")
        
        Firestore.firestore().collection("restaurants").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }

            var ii:Int = 0
            var temp_num:Int = -1
            
            for document in querySnapshot!.documents {
//                print("\(ii) ___ \(document.documentID) => \(document.data())")
                let result = Result {
                      try document.data(as: Restaurant.self)
                }
                    
                switch result {
                    case .success(let restaurant):
                        if let restaurant = restaurant {
                            self.restaurants.insert(restaurant, at: ii)
                            ZmV.sh().rt_im_st[ii] = self.restaurants[ii].im_storage
                            print("restaurants[\(ii)].name : \(self.restaurants[ii].name) ___ ZmV.sh().rt_im_st[\(ii)]: \(ZmV.sh().rt_im_st[ii])")
                            // A `City` value was successfully initialized from the DocumentSnapshot.
//                            print("restaurant: \(restaurant)")
                        } else {
                            // A nil value was successfully initialized from the DocumentSnapshot,
                            // or the DocumentSnapshot was nil.
                            print("Document does not exist")
                        }
                    case .failure(let error):
                        // A `City` value could not be initialized from the DocumentSnapshot.
                        print("Error decoding restaurant: \(error)")
                }
                ii += 1
            }
            temp_num = querySnapshot!.documents.count
            ZmF().dlog("ZmFbFs - get_exam_db_all - documents.count: \(temp_num)")
            
            self.refresh_all(querySnapshot!.documents.count)
        }
    }
    
    func loadData() {
        print("Home2View - loadData")
        
        imageView.load_im(1)
        labelTitle.text = "AppDesignKit"
        imageViewProfile.load_im(1)

        categories.removeAll()
        products.removeAll()

        categories.append("Shoes")
        categories.append("Shirts")
        categories.append("Watches")
        categories.append("Jeans")

        for _ in 0 ..< num_col_v_dis {
            var dict1: [String: String] = [:]
            dict1["title"] = ""
            dict1["brand"] = ""
            dict1["price"] = ""
            dict1["originalPrice"] = ""
            products.append(dict1)
        }

        refresh_view_all()
    }
    
    func refresh_all(_ cur_num: Int) {
        print("Home2View - refresh_all")
        
        num_col_v_dis = cur_num
        for ii in 0 ..< num_col_v_dis {
//            print("ZmFbFs().restaurants[0].name -- \(ZmFbFs().restaurants[ii].name)")
            
            var dict1: [String: String] = [:]
            
            dict1["title"] = restaurants[ii].name
            dict1["brand"] = restaurants[ii].city
            dict1["price"] = "$"+String(restaurants[ii].price*4)+".00"
            dict1["originalPrice"] = String(restaurants[ii].price)
            
            products.insert(dict1, at: ii)
        }
        
        refresh_view_all()
    }
    
    func refresh_view_all() {
        refreshCollectionViewSlider()
        refreshCollectionViewCategories()
        refreshCollectionViewDiscounts()
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func loadData6666() {
        print("Home2View - loadData")
        
        imageView.load_im(1)
        labelTitle.text = "AppDesignKit"
        imageViewProfile.load_im(1)

        categories.removeAll()
        products.removeAll()

        categories.append("Shoes")
        categories.append("Shirts")
        categories.append("Watches")
        categories.append("Jeans")

//        var dict1: [String: String] = [:]
//        dict1["title"] = "Suede Chukka Boots"
//        dict1["brand"] = "River Island"
//        dict1["price"] = "$79.00"
//        dict1["originalPrice"] = ""
//        products.append(dict1)
//
//        var dict6: [String: String] = [:]
//        dict6["title"] = "Jodhpur Boots"
//        dict6["brand"] = "House of Versace"
//        dict6["price"] = "$75"
//        dict6["originalPrice"] = "$97"
//        products.append(dict6)
        
//        ZmFbFs().get_exam_db_all(SC_H2V)
//        ZmFbFs().get_exam_db_all(2)
        
//        db 데이터 로딩 딜레이로 늦게 가져온다
        
//        ZmFbFs().restaurants[0].name = "777ㅁㄴㅇㅁㄴㅇ"
//        print("ZmFbFs().restaurants[0].name -- \(ZmFbFs().restaurants[0].name)")

        for _ in 0 ..< num_col_v_dis {
//            print("ZmFbFs().restaurants[0].name -- \(ZmFbFs().restaurants[ii].name)")
            
            var dict1: [String: String] = [:]
//            dict1["title"] = ZmFbFs().restaurants[ii].name
//            dict1["brand"] = ZmFbFs().restaurants[ii].city
            
            dict1["title"] = ""
            dict1["brand"] = ""
            dict1["price"] = ""
            dict1["originalPrice"] = ""
            products.append(dict1)
        }

        refresh_view_all()
    }
    
    func loadData22() {

//		imageView.sample("Ecommerce", "Bags", 5)
        imageView.load_im(1)
        
		labelTitle.text = "AppDesignKit"
//		imageViewProfile.sample("Social", "Portraits", 7)
        imageViewProfile.load_im(1)

		categories.removeAll()
		products.removeAll()

		categories.append("Shoes")
		categories.append("Shirts")
		categories.append("Watches")
		categories.append("Jeans")

		var dict1: [String: String] = [:]
		dict1["title"] = "Suede Chukka Boots"
		dict1["brand"] = "River Island"
		dict1["price"] = "$79.00"
		dict1["originalPrice"] = ""
		products.append(dict1)

		var dict2: [String: String] = [:]
		dict2["title"] = "Platform Derby Shoes"
		dict2["brand"] = "Stella McCartney"
		dict2["price"] = "$384"
		dict2["originalPrice"] = "$640"
		products.append(dict2)

		var dict3: [String: String] = [:]
		dict3["title"] = "Hiking boots"
		dict3["brand"] = "Dolce & Gabbana"
		dict3["price"] = "$59"
		dict3["originalPrice"] = "$70"
		products.append(dict3)

		var dict4: [String: String] = [:]
		dict4["title"] = "Motocross boots"
		dict4["brand"] = "Hermes"
		dict4["price"] = "$48"
		dict4["originalPrice"] = ""
		products.append(dict4)

		var dict5: [String: String] = [:]
		dict5["title"] = "Riding boots"
		dict5["brand"] = "Armani"
		dict5["price"] = "$98"
		dict5["originalPrice"] = ""
		products.append(dict5)

		var dict6: [String: String] = [:]
		dict6["title"] = "Jodhpur Boots"
		dict6["brand"] = "House of Versace"
		dict6["price"] = "$75"
		dict6["originalPrice"] = "$97"
		products.append(dict6)

		refreshCollectionViewSlider()
		refreshCollectionViewCategories()
		refreshCollectionViewDiscounts()
	}

	// MARK: - Refresh methods
	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewSlider() {

		collectionViewSlider.reloadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewCategories() {

		collectionViewCategories.reloadData()
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func refreshCollectionViewDiscounts() {

		collectionViewDiscounts.reloadData()
	}

	// MARK: - User actions
	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionProfile(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@objc func actionDiscountsMore(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllCategories(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	@IBAction func actionSeeAllDiscounts(_ sender: UIButton) {

		print(#function)
		dismiss(animated: true)
	}
}

// MARK: - UICollectionViewDataSource
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UICollectionViewDataSource {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("Home2View - UICollectionViewDataSource - numberOfSections")

		return 1
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Home2View - UICollectionViewDataSource - numberOfItemsInSection")

		if (collectionView == collectionViewSlider)		{ return num_col_v_slr }
		if (collectionView == collectionViewCategories)	{ return num_col_v_ctg }
        if (collectionView == collectionViewDiscounts)    { return num_col_v_dis }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Home2View - UICollectionViewDataSource - cellForItemAt")

		if (collectionView == collectionViewSlider) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2Cell1", for: indexPath) as! Home2Cell1
			cell.bindData(index: indexPath.item)
			return cell
		}

		if (collectionView == collectionViewCategories) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2Cell2", for: indexPath) as! Home2Cell2
			cell.bindData(category: categories[indexPath.row])
			return cell
		}

		if (collectionView == collectionViewDiscounts) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home2Cell3", for: indexPath) as! Home2Cell3
			cell.bindData(index: indexPath.item, data: products[indexPath.row])
			cell.buttonMore.tag = indexPath.row
			cell.buttonMore.addTarget(self, action: #selector(actionDiscountsMore(_:)), for: .touchUpInside)
			return cell
		}

		return UICollectionViewCell()
	}
}

// MARK: - UICollectionViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UICollectionViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print(#function)
		if (collectionView == collectionViewSlider) { }
		if (collectionView == collectionViewCategories) { }
		if (collectionView == collectionViewDiscounts) { }
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UICollectionViewDelegateFlowLayout {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("Home2View - UICollectionViewDelegateFlowLayout - sizeForItemAt")

		let width = collectionView.frame.size.width
		let height = collectionView.frame.size.height
		let categoriesCellWidth = (width-15)/2

		if (collectionView == collectionViewSlider) { return CGSize(width: width-100, height: height) }
		if (collectionView == collectionViewCategories) { return CGSize(width: categoriesCellWidth, height: 40) }
		if (collectionView == collectionViewDiscounts) { return CGSize(width: categoriesCellWidth, height: categoriesCellWidth+30) }

		return CGSize.zero
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        print("Home2View - UICollectionViewDelegateFlowLayout - minimumLineSpacingForSectionAt")

		if (collectionView == collectionViewSlider) { return 15 }
		if (collectionView == collectionViewCategories) { return 15 }
		if (collectionView == collectionViewDiscounts) { return 15 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        print("Home2View - UICollectionViewDelegateFlowLayout - minimumInteritemSpacingForSectionAt")

		if (collectionView == collectionViewSlider) { return 15 }
		if (collectionView == collectionViewCategories) { return 15 }
		if (collectionView == collectionViewDiscounts) { return 15 }

		return 0
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        print("Home2View - UICollectionViewDelegateFlowLayout - insetForSectionAt")

		if (collectionView == collectionViewSlider) { return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50) }
		if (collectionView == collectionViewCategories) { return UIEdgeInsets.zero }
		if (collectionView == collectionViewDiscounts) { return UIEdgeInsets.zero }

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
}

// MARK: - UIScrollViewDelegate
//-------------------------------------------------------------------------------------------------------------------------------------------------
extension Home2View: UIScrollViewDelegate {

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("Home2View - UIScrollViewDelegate - scrollViewDidEndDecelerating")
	}
}
