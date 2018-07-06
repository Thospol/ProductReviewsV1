
import UIKit

class ProductDetailViewController: UIViewController {
	
	@IBOutlet weak var productDetailXibView: ProductDetailXibView!
	var modelProduct: Product?
	var mode: Mode?
	var indexpathModel: IndexPath?
	override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if let selectedProduct = modelProduct{
			productDetailXibView.setup(product: selectedProduct)
		}
		
	}
	
}
