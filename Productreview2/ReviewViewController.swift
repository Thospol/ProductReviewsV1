import UIKit

class ReviewViewController: UICollectionViewController {
	private let reuseIdentifier = "cellReview"
	private let reuseIdentifier2 = "cellReviewadd"
	var productFromProduct: Product?
	var checkNameProduct: String?
	var indexpathProduct: IndexPath?
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		collectionView?.reloadData()
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("selected Row:\(indexPath.item)")
		if indexPath.row == 0 {
			performSegue(withIdentifier: "AddReview", sender: nil)
		}else{
			
		}
	}
	
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return (productFromProduct?.reviewProduct.count)! + 1
    }
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
																		 withReuseIdentifier: "ShowHeader",
			for: indexPath) as! ReviewCollectionViewCell
		 let Production = productFromProduct
		headerView.configureWithHeader(value: Production!)
		return headerView
	}
	

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.item == 0{
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath as IndexPath) as! ReviewCollectionViewCell
			
			return cell
			}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ReviewCollectionViewCell
		
		let reviewProduct = productFromProduct?.reviewProduct ?? []
		let product = reviewProduct[indexPath.row - 1]
		cell.configureWith(value: product)
        return cell
		
}
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if let viewController = segue.destination as? AddReviewViewController{
			if let data = productFromProduct {
				viewController.dataProduct = data
				viewController.indexpathProduct = indexpathProduct
				print("Data is:\(data)")
				print("Index path is:\(viewController.indexpathProduct!)")
			}
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
