
import UIKit
import os.log
class ShowDetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
	
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var reviewCountRed: UILabel!
    @IBOutlet weak var reviewCountYellow: UILabel!
    @IBOutlet weak var reviewCountGreen: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productDescription: UITextView!
	@IBOutlet weak var editButton: UIBarButtonItem!
	
	private var productDetail: Product!
	var indexpathProduct: IndexPath?
	var mode: Mode?
	var checkNameProduct: String?
	
    override func viewDidLoad() {
		super.viewDidLoad();
		view.addSubview(scrollView)
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		productDetail = Store.default.get()[indexpathProduct!.row - 1]
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if let product = productDetail {
			product.manageRank()
			productName.text   = product.product
			productimage.image = product.productConvertToImage
			productDescription.text = product.desc
			productPrice.text = "\(String(product.price)) ฿"
			reviewCountGreen.text = String(product.likes)
			reviewCountYellow.text = String(product.fairs)
			reviewCountRed.text = String(product.bads)
			collectionView.reloadData()
			
		}
	}
	override func viewWillLayoutSubviews(){
		super.viewWillLayoutSubviews()
		scrollView.contentSize = CGSize(width: 375, height: 1000)
	}
	// MARK: UICollectionViewDataSource
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return (productDetail?.reviewProduct.count)! < 2 ? (productDetail?.reviewProduct.count)! : 2
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellDetail", for: indexPath as IndexPath) as! ShowDetailCollectionViewCell
		let reviewProduct = productDetail?.reviewProduct ?? []
		let product = reviewProduct[indexPath.row]
		cell.configureWith(value: product)
		return cell
	}
	
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TapPictrue(_ sender: UITapGestureRecognizer) {
        let imagepickerController = UIImagePickerController()
        imagepickerController.sourceType = .photoLibrary
        imagepickerController.delegate = self
        present(imagepickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image")
        }
        productimage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func CancleShowDetail(_ sender: Any) {
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
	
	@IBAction func onEdit(sender: UIBarButtonItem) {
		mode = Mode.edit
		performSegue(withIdentifier: "ShowDetailEdit", sender: productDetail)
	}
	@IBAction func ShowallReview(_ sender: Any) {
		performSegue(withIdentifier: "ShowReview", sender: productDetail)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if let viewController = segue.destination as? AddProductViewController{
			viewController.dataProductViewcontroller = sender as? Product
			viewController.indexpathProduct = indexpathProduct
			print("Index path is:\(viewController.indexpathProduct!)")
			viewController.mode = mode
		}
		
		if let ReviewViewController = segue.destination as? ReviewViewController{
			ReviewViewController.indexpathProduct = indexpathProduct
			
		}
	}
	
}
