import UIKit
class ReviewViewController: UICollectionViewController {
	private let reuseIdentifier = "cellReview"
	private let reuseIdentifier2 = "cellReviewadd"
	
	private var productFromProduct: Product!
	var checkNameProduct: String?
	var indexpathProduct: IndexPath?
	let products = Store.default.get()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		productFromProduct = Store.default.get()[indexpathProduct!.row - 1]
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		productFromProduct?.manageRank()
		collectionView?.reloadData()
		collectionView?.reloadSections(IndexSet([0]))
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("selected Row:\(indexPath.item)")
		if indexPath.row == 0 {
			performSegue(withIdentifier: "AddReview", sender: productFromProduct)
		}else{
			
		}
	}
	
	// MARK: UICollectionViewDataSource
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return products[indexpathProduct!.row - 1].reviewProduct.count + 1
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,at indexPath: IndexPath) -> UICollectionReusableView {
		let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: "ShowHeader",for: indexPath) as! ReviewCollectionViewCell
		let Production = productFromProduct
		headerView.configureWithHeader(value: Production!)
		return headerView
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.item == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath as IndexPath) as! ReviewCollectionViewCell
			return cell
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ReviewCollectionViewCell
			guard let reviewProduct =  productFromProduct?.reviewProduct, !reviewProduct.isEmpty else {
				return UICollectionViewCell()
			}
			let product = reviewProduct[indexPath.row - 1]
			cell.configureWith(value: product)
			return cell
		}
	}
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if let viewController = segue.destination as? AddReviewViewController{
			//viewController.dataProduct = sender as? Product
			viewController.indexpathProduct = indexpathProduct
			print("Index path is:\(viewController.indexpathProduct!)")
		}
	}
	
	@IBAction func CancleReviewCollection(_ sender: Any) {
		let isPresentingInAddMealMode = presentingViewController is UINavigationController
		
		if isPresentingInAddMealMode {
			dismiss(animated: true, completion: nil)
		}
		else if let owningNavigationController = navigationController{
			owningNavigationController.popViewController(animated: true)
		}
		else {
			fatalError("Unexpected")
		}
	}
	
	@IBAction func unwindToReviewProductList(sender: UIStoryboardSegue) {
	}
}
