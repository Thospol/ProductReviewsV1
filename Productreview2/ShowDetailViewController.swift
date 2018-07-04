//
//  ShowDetailViewController.swift
//  Productreview2
//
//  Created by thospol on 1/7/61.
//  Copyright © พ.ศ. 2561 thospol. All rights reserved.
//

import UIKit
import os.log
class ShowDetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate {
	
	@IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var reviewCountRed: UILabel!
    @IBOutlet weak var reviewCountYellow: UILabel!
    @IBOutlet weak var reviewCountGreen: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDesc: UITextView!
	@IBOutlet weak var editButton: UIBarButtonItem!
	
	
	var productDetail: Product?
	var indexpathProduct: IndexPath?
	var mode: Mode?
	var checkNameProduct: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if let product = productDetail {
			product.manageRank()
			navigationItem.title = product.product
			productName.text   = product.product
			productimage.image = product.photo
			productDesc.text = product.desc
			productPrice.text = String(product.price)
			reviewCountGreen.text = String(product.veryGoods)
			reviewCountYellow.text = String(product.goods)
			reviewCountRed.text = String(product.bads)
		}
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
        // Set ให้ไปลงใน imageview
        productimage.image = selectedImage
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Cancleclick(_ sender: Any) {
		navigationController?.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
	
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //เป็นการส่งค่าไปยังcontrollerที่เราทำsegue
		super.prepare(for: segue, sender: sender)
		if let viewController = segue.destination as? ViewController{
		if let data = productDetail {
			viewController.dataProductViewcontroller = data
			viewController.indexpathProduct = indexpathProduct
			print("Data is:\(data)")
			print("Index path is:\(viewController.indexpathProduct!)")
			viewController.mode = mode //ส่งค่า modeไปยังController ที่ seque ไปซึ่งจะมีตัวแปรmodeอยู่
			}
		}
		if let ReviewViewController = segue.destination as? ReviewViewController{
			if let data = productDetail{
			ReviewViewController.productFromProduct = data
			ReviewViewController.checkNameProduct = checkNameProduct
			ReviewViewController.indexpathProduct = indexpathProduct
			print("Data is:\(data)")
			print("Index path is:\(ReviewViewController.indexpathProduct!)")
			print("NameProduct is: \(ReviewViewController.checkNameProduct!)")
			}
		}
	}
	
	@IBAction func onEdit(sender: UIBarButtonItem) { //กดปุ่มedit ก็จะsegueไปยังidentitieที่performไว้ แล้วจะส่งค่าต่างๆที่func prepare
		mode = Mode.edit
		performSegue(withIdentifier: "ShowDetailEdit", sender: nil)
	}
    
	@IBAction func ShowallReview(_ sender: Any) {
		performSegue(withIdentifier: "ShowReview", sender: nil)
	}
	
}
