import UIKit
import os.log
import SkyFloatingLabelTextField
enum Mode {
	case edit
	case add
}
class AddProductViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var productName: UITextView!
    @IBOutlet weak var productdesc: UITextView!
    @IBOutlet weak var productPrice: UITextView!
    @IBOutlet weak var productButton: UIButton!
	@IBOutlet weak var showdefaultPictrue: UIImageView!
	@IBOutlet weak var showdefaultLabel: UILabel!
	var dataProductViewcontroller : Product?
	var indexpathProduct: IndexPath?
	var mode: Mode? = Mode.add

    override func viewDidLoad() {
        super.viewDidLoad()
		if let product = dataProductViewcontroller {
			productName.text   = product.product
			productimage.image = product.photo
			productdesc.text = product.desc
			productPrice.text = String(product.price)
			showdefaultPictrue.isHidden = true
			showdefaultLabel.isHidden = true
		}
       // updateSaveButtonState()
    }

    //REMARK:- delegateTextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        productButton.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    //REMARK:- UpdateTextField
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = productName.text ?? ""
         productButton.isEnabled = !text.isEmpty
        
    }
    //REMARK:- delegateimagepicker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
     //REMARK:- TapPictrue
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
		showdefaultPictrue.isHidden = true
		showdefaultLabel.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    //REMARK:- Segua
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if productButton === sender as! UIButton {
			let photos = productimage.image
			let productname = productName.text ?? ""
			let desc = productdesc.text
			let price = productPrice.text
			let product = Product(product: productname, photo: photos, desc: desc!, price: Int(price!)!)
			guard let mode = mode else { return }
			switch mode {
			case .add:
				UserModel.product.append(product)
			case .edit:
				guard let indexPath = indexpathProduct else { return }
				
				UserModel.product[indexPath.row - 1] = product
				UserModel.product[indexPath.row - 1].reviewProduct = (dataProductViewcontroller?.reviewProduct)!
			}
		}
	}
	@IBAction func CancleAddProduct(_ sender: Any) {
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
}


