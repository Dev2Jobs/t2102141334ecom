//
//  Zm_FB_FS.swift
//  t2102141334ecom
//
//  Created by soul on 2021/03/05.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift
import SDWebImage


//class Zm_FB_FS: UIViewController, UITableViewDataSource, UITableViewDelegate {
class Zm_FB_FS: UIViewController {

//  @IBOutlet var tableView: UITableView!
//  @IBOutlet var activeFiltersStackView: UIStackView!
//  @IBOutlet var stackViewHeightConstraint: NSLayoutConstraint!
//
//  @IBOutlet var cityFilterLabel: UILabel!
//  @IBOutlet var categoryFilterLabel: UILabel!
//  @IBOutlet var priceFilterLabel: UILabel!
//
//  let backgroundView = UIImageView()

    var db: Firestore!
    
//    var cur_db_doc: DocumentReference
    
//    private var restaurants: [Restaurant] = []
    private var documents: [DocumentSnapshot] = []

    var restaurants: [Restaurant] = []
//    var documents: [DocumentSnapshot] = []
  
    fileprivate var query: Query? {
//    var query: Query? {
        didSet {
            if let listener = listener {
                listener.remove()
                observeQuery()
            }
        }
    }

    private var listener: ListenerRegistration?

  
//    func get_exam_db_all() {
//        db.collection("cities").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
//    }
    
    func get_exam_db_all(_ cur_scene: Int) {
        ZmFunc().dlog("Zm_FB_FS - get_exam_db_all - cur_scene: \(cur_scene)")
        
        Firestore.firestore().collection("restaurants").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }

            var ii:Int = 0
            
            for document in querySnapshot!.documents {
//                print("\(ii) ___ \(document.documentID) => \(document.data())")
                let result = Result {
                      try document.data(as: Restaurant.self)
                }
                    
                switch result {
                    case .success(let restaurant):
                        if let restaurant = restaurant {
                            self.restaurants.insert(restaurant, at: ii)
                            print("restaurants[\(ii)].name_______: \(self.restaurants[ii].name)")
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
            Home2View().refresh_all()
        }
    }
    
    func get_exam_db_all() {
        ZmFunc().dlog("Zm_FB_FS - get_exam_db_all")
        
        Firestore.firestore().collection("restaurants").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }

            var ii:Int = 0
            
            for document in querySnapshot!.documents {
                print("\(ii) ___ \(document.documentID) => \(document.data())")
//                document.reference.delete()
                
//                let cities = querySnapshot!.documents.map { $0["name"]! }
//                print("Current cities in CA: \(cities)")
                
//                document.data().
                
//                restaurants[ii].name
//                restaurants[ii].city
                
                print("Document ======== 1")
  /*
                var sdfsdf333:tttsdfsdf333 = tttsdfsdf333.init()
                
                sdfsdf333.price = 77776
                
                print("Current sdfsdf333.price: \(sdfsdf333.price)")
                
                var sdfsdf222:tttsdfsdf222 = tttsdfsdf222.init()
                
                sdfsdf222.price = 25234
                
                print("Current sdfsdf222.price: \(sdfsdf222.price)")
                
                var sdfsdf:tttsdfsdf = tttsdfsdf.init()
                
                sdfsdf.price = 1412
                
                print("Current sdfsdf?.price: \(sdfsdf.price)")
                
                var asdsdfsdf: [tttsdfsdf]? = []
                
                asdsdfsdf?[0].price = 5352
                
                print("Current asdsdfsdf?[0].price: \(asdsdfsdf?[0].price)")
//                =============
                var restsdf4: [Restaurant] = []
                
                var aas434:Restaurant
   
//                aas434 = Restaurant()
                
//                aas434.price = 214
                
//                restsdf4[0].name = "dfsdfsd"
                restsdf4[0].price = 732
                print("Current cities in CA: \(restsdf4[0].price)")
  */
                let result = Result {
                      try document.data(as: Restaurant.self)
                }
                    
                switch result {
                    case .success(let restaurant):
                        if let restaurant = restaurant {
                            
                            self.restaurants.insert(restaurant, at: ii)
                            
                            print("restaurants[\(ii)].name_______: \(self.restaurants[ii].name)")
                            
//                            self.restaurants[0].name = "123ㄴㅇㄹㄴ"
//                            self.restaurants[ii].name = "ㅁㄴㅇㅁㄴ"
                            
//                            self.restaurants.append(restaurant)
//                            self.restaurants[ii] = Restaurant(from: restaurant as! Decoder)

                            // A `City` value was successfully initialized from the DocumentSnapshot.
                            print("restaurant: \(restaurant)")
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
        }
    }
        
    func get_exam_db_all333() {
        ZmFunc().dlog("Zm_FB_FS - get_exam_db_all")
        
//        let collection = Firestore.firestore().collection("restaurants")
//        let restaurantRef = collection.document()
        let restaurantRef = Firestore.firestore().collection("restaurants").document("2J30XKqeaJjbb6BbRlTv")
        
        restaurantRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
        
        /*
        let docRef = db.collection("cities").document("SF")

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }*/
    }
    
//    fileprivate func get_exam_db_all() -> [Restaurant] {
    func get_exam_db_all22() {
        ZmFunc().dlog("Zm_FB_FS - get_exam_db_all")
    
//        guard let query = query else {
//            ZmFunc().dlog("Zm_FB_FS - get_exam_db_all - 1")
//            return }
//        stopObserving()
        
//        guard query = baseQuery() else {
//            ZmFunc().dlog("Zm_FB_FS - get_exam_db_all - 2")
//            return }

//        let query = baseQuery()
        
    // Display data from Firestore, part one

/*
        listener = query.addSnapshotListener { [unowned self] (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results: \(error!)")
                return
            }
      
            let models = snapshot.documents.map { (document) -> Restaurant in
                let maybeModel: Restaurant?
        
                do {
                    maybeModel = try document.data(as: Restaurant.self)
                } catch {
                    fatalError("Unable to initialize type \(Restaurant.self) with dictionary \(document.data()): \(error)")
                }

                if let model = maybeModel {
                    return model
                } else {
          // Don't use fatalError here in a real app.
                    fatalError("Missing document of type \(Restaurant.self) at \(document.reference.path)")
                }
            }
      
            self.restaurants = models
            self.documents = snapshot.documents
            
            print("self.restaurants[0].name -- \(self.restaurants[0].name)")
//            return self.restaurants
*/
//      if self.documents.count > 0 {
//        self.tableView.backgroundView = nil
//      } else {
//        self.tableView.backgroundView = self.backgroundView
//      }
//
//      self.tableView.reloadData()
//    }
  }

    fileprivate func observeQuery() {
        ZmFunc().dlog("Zm_FB_FS - observeQuery")
    
        guard let query = query else { return }
        stopObserving()

    // Display data from Firestore, part one

    
        listener = query.addSnapshotListener { [unowned self] (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results: \(error!)")
                return
            }
      
            let models = snapshot.documents.map { (document) -> Restaurant in
                let maybeModel: Restaurant?
        
                do {
                    maybeModel = try document.data(as: Restaurant.self)
                } catch {
                    fatalError("Unable to initialize type \(Restaurant.self) with dictionary \(document.data()): \(error)")
                }

                if let model = maybeModel {
                    return model
                } else {
          // Don't use fatalError here in a real app.
                    fatalError("Missing document of type \(Restaurant.self) at \(document.reference.path)")
                }
            }
      
            self.restaurants = models
            self.documents = snapshot.documents

//      if self.documents.count > 0 {
//        self.tableView.backgroundView = nil
//      } else {
//        self.tableView.backgroundView = self.backgroundView
//      }
//
//      self.tableView.reloadData()
    }
  }

    
    fileprivate func stopObserving() {
        ZmFunc().dlog("Zm_FB_FS - stopObserving")

        listener?.remove()
    }

    fileprivate func baseQuery() -> Query {
        ZmFunc().dlog("Zm_FB_FS - baseQuery")

        return Firestore.firestore().collection("restaurants").limit(to: 50)
    }

  
//    lazy private var filters: (navigationController: UINavigationController,
//                             filtersController: FiltersViewController) = {
//    return FiltersViewController.fromStoryboard(delegate: self)
//  }()

    override func viewDidLoad() {
        ZmFunc().dlog("Zm_FB_FS - viewDidLoad")
    
        super.viewDidLoad()
//    backgroundView.image = UIImage(named: "pizza-monster")!
//    backgroundView.contentMode = .scaleAspectFit
//    backgroundView.alpha = 0.5
//    tableView.backgroundView = backgroundView
//    tableView.tableFooterView = UIView()
//
//    // Blue bar with white color
//    navigationController?.navigationBar.barTintColor =
//      UIColor(red: 0x3d/0xff, green: 0x5a/0xff, blue: 0xfe/0xff, alpha: 1.0)
//    navigationController?.navigationBar.isTranslucent = false
//    navigationController?.navigationBar.titleTextAttributes =
//      [ NSAttributedString.Key.foregroundColor: UIColor.white ]
//
//    tableView.dataSource = self
//    tableView.delegate = self
        
        query = baseQuery()
        
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
        
//    stackViewHeightConstraint.constant = 0
//    activeFiltersStackView.isHidden = true
//
//    self.navigationController?.navigationBar.barStyle = .black
    }

  
    override func viewWillAppear(_ animated: Bool) {
        ZmFunc().dlog("Zm_FB_FS - viewWillAppear")
        
        super.viewWillAppear(animated)
        self.setNeedsStatusBarAppearanceUpdate()
        observeQuery()
    }
  
    override func viewDidAppear(_ animated: Bool) {
        ZmFunc().dlog("Zm_FB_FS - viewDidAppear")
    
        super.viewDidAppear(animated)
        
//    let auth = FUIAuth.defaultAuthUI()!
//    if auth.auth?.currentUser == nil {
//        ZmFunc().dlog("Zm_FB_FS - viewDidAppear - NO auth -> email create")
//
//      let emailAuthProvider = FUIEmailAuth()
//      auth.providers = [emailAuthProvider]
//      present(auth.authViewController(), animated: true, completion: nil)
//    }else {
//        ZmFunc().dlog("Zm_FB_FS - viewDidAppear - Already auth")
//    }
    }

  
    override func viewWillDisappear(_ animated: Bool) {
        ZmFunc().dlog("Zm_FB_FS - viewWillDisappear")
    
        super.viewWillDisappear(animated)
        stopObserving()
    }

//    @IBAction func didTapPopulateButton(_ sender: Any) {
    func set_exam_db_all() {
        ZmFunc().dlog("Zm_FB_FS - didTapPopulateButton")

    
        let words = ["Bar", "Fire", "Grill", "Drive Thru", "Place", "Best", "Spot", "Prime", "Eatin'"]

        let cities = Restaurant.cities
        let categories = Restaurant.categories

        var temp_num:Int = 0
        
        for _ in 0 ..< 20 {
            let randomIndexes = (Int(arc4random_uniform(UInt32(words.count))),
                           Int(arc4random_uniform(UInt32(words.count))))
            let name = words[randomIndexes.0] + " " + words[randomIndexes.1]
            let category = categories[Int(arc4random_uniform(UInt32(categories.count)))]
            let city = cities[Int(arc4random_uniform(UInt32(cities.count)))]
            let price = Int(arc4random_uniform(3)) + 1
            let photo = Restaurant.imageURL(forName: name)

            temp_num = temp_num+1
            ZmFunc().dlog("__\(temp_num)__ randomIndexes \(randomIndexes) - name \(name) - category \(category) - city \(city) - price \(price) - words.count \(words.count)")
       
            ZmFunc().dlog("photo \(photo)")
        
      // Basic writes
            let collection = Firestore.firestore().collection("restaurants")
            let restaurant = Restaurant(
                name: name,
                category: category,
                city: city,
                price: price,
                ratingCount: 10,
                averageRating: 0,
                photo: photo
            )

            let restaurantRef = collection.document()
            do {
                try restaurantRef.setData(from: restaurant)
            } catch {
                fatalError("Encoding Restaurant failed: \(error)")
            }

            let batch = Firestore.firestore().batch()
            guard let user = Auth.auth().currentUser else { continue }
            var average: Float = 0
            for _ in 0 ..< 10 {
                let rating = Int(arc4random_uniform(5) + 1)
        average += Float(rating) / 10
                let text = rating > 3 ? "good" : "food was too spicy"
                let review = Review(rating: rating,
                            userID: user.uid,
                            username: user.displayName ?? "Anonymous",
                            text: text,
                            date: Timestamp())
                let ratingRef = restaurantRef.collection("ratings").document()
        
                do {
                    try batch.setData(from: review, forDocument: ratingRef)
                } catch {
                    fatalError("Encoding Rating failed: \(error)")
                }
            }
            
            batch.updateData(["avgRating": average], forDocument: restaurantRef)
            batch.commit(completion: { (error) in
                guard let error = error else { return }
                print("Error generating reviews: \(error). Check your Firestore permissions.")
            })
        }
    }
  
//    @IBAction func didTapClearButton(_ sender: Any) {
//        ZmFunc().dlog("Zm_FB_FS - didTapClearButton")
//
//    filters.filtersController.clearFilters()
//    controller(filters.filtersController, didSelectCategory: nil, city: nil, price: nil, sortBy: nil)
//  }
//
//  @IBAction func didTapFilterButton(_ sender: Any) {
//    ZmFunc().dlog("Zm_FB_FS - didTapFilterButton")
//
//    present(filters.navigationController, animated: true, completion: nil)
//  }

  
    override var preferredStatusBarStyle: UIStatusBarStyle {
        set {}
        get {
            return .lightContent
        }
    }

    deinit {
        listener?.remove()
    }

  // MARK: - UITableViewDataSource

//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    ZmFunc().dlog("RestaurantsTableView - tableView - cellForRowAt")
//
//    let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell",
//                                             for: indexPath) as! RestaurantTableViewCell
//    let restaurant = restaurants[indexPath.row]
//    cell.populate(restaurant: restaurant)
//    return cell
//  }

//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    ZmFunc().dlog("RestaurantsTableView - tableView - numberOfRowsInSection - restaurants.count - \(restaurants.count)")
//
//    return restaurants.count
//  }

  // MARK: - UITableViewDelegate
/*
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    ZmFunc().dlog("RestaurantsTableView - tableView")
        
    tableView.deselectRow(at: indexPath, animated: true)
    let controller = RestaurantDetailViewController.fromStoryboard()
    controller.titleImageURL = restaurants[indexPath.row].photo
    controller.restaurant = restaurants[indexPath.row]
    controller.restaurantReference = documents[indexPath.row].reference
    self.navigationController?.pushViewController(controller, animated: true)
  }
*/
}

//extension Zm_FB_FS: FiltersViewControllerDelegate {
extension Zm_FB_FS {
        
    func query(withCategory category: String?, city: String?, price: Int?, sortBy: String?) -> Query {
    
        ZmFunc().dlog("Zm_FB_FS - query - \(category) - \(city) - \(price) - \(sortBy)")
        
        var filtered = baseQuery()

//        if category == nil && city == nil && price == nil && sortBy == nil {
//      stackViewHeightConstraint.constant = 0
//      activeFiltersStackView.isHidden = true
//    } else {
//      stackViewHeightConstraint.constant = 44
//      activeFiltersStackView.isHidden = false
//    }

    // Advanced queries
    
        if let category = category, !category.isEmpty {
            filtered = filtered.whereField("category", isEqualTo: category)
        }
   
        if let city = city, !city.isEmpty {
            filtered = filtered.whereField("city", isEqualTo: city)
        }
    
        if let price = price {
            filtered = filtered.whereField("price", isEqualTo: price)
        }
    
        if let sortBy = sortBy, !sortBy.isEmpty {
            filtered = filtered.order(by: sortBy)
        }
    
        return filtered
    }

//  func controller(_ controller: FiltersViewController,
//                  didSelectCategory category: String?,
//                  city: String?,
//                  price: Int?,
//                  sortBy: String?) {
//
//    ZmFunc().dlog("Zm_FB_FS - controller - \(category) - \(city) - \(price) - \(sortBy)")
//
//    let filtered = query(withCategory: category, city: city, price: price, sortBy: sortBy)
//
//    if let category = category, !category.isEmpty {
//      categoryFilterLabel.text = category
//      categoryFilterLabel.isHidden = false
//    } else {
//      categoryFilterLabel.isHidden = true
//    }
//
//    if let city = city, !city.isEmpty {
//      cityFilterLabel.text = city
//      cityFilterLabel.isHidden = false
//    } else {
//      cityFilterLabel.isHidden = true
//    }
//
//    if let price = price {
//      priceFilterLabel.text = priceString(from: price)
//      priceFilterLabel.isHidden = false
//    } else {
//      priceFilterLabel.isHidden = true
//    }
//
//    self.query = filtered
//    observeQuery()
//  }

}

//class RestaurantTableViewCell: UITableViewCell {
//
//  @IBOutlet private var thumbnailView: UIImageView!
//
//  @IBOutlet private var nameLabel: UILabel!
//
//  @IBOutlet var starsView: ImmutableStarsView!
//
//  @IBOutlet private var cityLabel: UILabel!
//
//  @IBOutlet private var categoryLabel: UILabel!
//
//  @IBOutlet private var priceLabel: UILabel!
//
//  func populate(restaurant: Restaurant) {
//    ZmFunc().dlog("RestaurantTableViewCell - populate")
//
//    // Displaying data, part two
//
//    nameLabel.text = restaurant.name
//    cityLabel.text = restaurant.city
//    categoryLabel.text = restaurant.category
//    starsView.rating = Int(restaurant.averageRating.rounded())
//    priceLabel.text = priceString(from: restaurant.price)
//
//    let image = restaurant.photo
//    thumbnailView.sd_setImage(with: image)
//  }
//
//  override func prepareForReuse() {
//    ZmFunc().dlog("RestaurantTableViewCell - prepareForReuse")
//
//    super.prepareForReuse()
//    thumbnailView.sd_cancelCurrentImageLoad()
//  }
//
//}
