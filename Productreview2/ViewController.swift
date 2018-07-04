import UIKit
import os.log

enum Mode {
	case edit
	case add
}

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
	
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productdesc: UITextView!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productButton: UIButton!
	
	var dataProductViewcontroller : Product?
	var indexpathProduct: IndexPath?
	var mode: Mode? = Mode.add

    override func viewDidLoad() {
        super.viewDidLoad()
		
		if let product = dataProductViewcontroller {
			navigationItem.title = product.product //แสดงบน navigation
			productName.text   = product.product
			productimage.image = product.photo
			productdesc.text = product.desc
			productPrice.text = String(product.price)
		}
		
        setTextView()
        updateSaveButtonState()
    }
 
    func setTextView(){
        productdesc.layer.borderWidth = 1.0
        productdesc.layer.borderColor = UIColor.clear.cgColor
        productdesc.layer.masksToBounds = true
        productdesc.layer.shadowColor = UIColor.black.cgColor
        productdesc.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        productdesc.layer.shadowOpacity = 1.0
        productdesc.layer.shadowRadius = 2.0
        productdesc.layer.backgroundColor = UIColor.clear.cgColor
    }
    
    //REMARK:- delegateTextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // hide the keyboard
        textField.resignFirstResponder()
        
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
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
        // Set ให้ไปลงใน imageview
        productimage.image = selectedImage
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
	
	
	
    //REMARK:- Segua
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //ทำงานหลังจากsegue ตอนกดปุ่มเพิ่มข้อมูล
        
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
				UserModel.product[indexPath.row] = product
			}
        }
    }
	
}


