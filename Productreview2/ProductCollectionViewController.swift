import UIKit
import os.log

class ProductCollectionViewController: UICollectionViewController {
	
	let reuseIdentifier = "cell1"
	let reuseIden2 = "cell2"
	var pushData: Product?
	var indexPath: IndexPath?
	var checkNameProduct:String?
	override func viewDidLoad() {
		super.viewDidLoad()
		loadSampleMeals()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		collectionView?.reloadData()
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return UserModel.product.count 
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if indexPath.item == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ProductCollectionViewCell
			return cell
		}else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIden2, for: indexPath as IndexPath) as! ProductCollectionViewCell
			let products = UserModel.product[indexPath.row]
			cell.configureData(value: products) // configureData เซ้ตdataไว้
			return cell
		}
		
	}
	

	
	func loadSampleMeals() {
		
		let photo1 = UIImage(named: "jbl")!
		let photo2 = UIImage(named: "anitech")!
		let photo3 = UIImage(named: "jbl")!
		let addproduct1 = Product(product: "jbl", photo: photo1, desc: "ไม่มีข้อมูล", price: 599)
		let addproduct2 = Product(product: "anitech", photo: photo2, desc: "ไม่มีข้อมูล", price: 399)
		let addproduct3 = Product(product: "jbl", photo: photo3, desc: "ไม่มีข้อมูล", price: 500)
		UserModel.product.append(addproduct1)
		UserModel.product.append(addproduct2)
		UserModel.product.append(addproduct3)
		collectionView?.reloadData()
	}
	
	@IBAction func unwindToProductList(sender: UIStoryboardSegue) {
		
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {//เมื่อกดเลือก collectionviewสักอัน
		print("You selected cell #\(indexPath.item)!")
		if indexPath.row == 0 {
			performSegue(withIdentifier: "AddItem", sender: nil)
		} else {
			pushData = UserModel.product[indexPath.row] //row เท่ากับ 1
			self.indexPath = indexPath //กำหนดindexpath เพื่อส่งindexไปยังหน้าที่เราsegue
			performSegue(withIdentifier: "ShowDetail", sender: nil) //วิ่งไปยัง seque ที่indentified ShowDetail แต่่มันจะไปทำprepareอิกทีเพื่อส่งข้อมูลไปยังหน้า controllerที่เราsegueไป
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //การแสดงผล
		super.prepare(for: segue, sender: sender)
		
		if let ShowDetailViewController = segue.destination as? ShowDetailViewController { //อ้างอิงไปยัง segue ของ ShowDetailViewController
			if let data = pushData {
				ShowDetailViewController.productDetail = data //ส่งdataไปยัง controlellerที่segue
				ShowDetailViewController.indexpathProduct = indexPath //ส่งindexpathไปยังcontrollerที่seguaหา
				ShowDetailViewController.checkNameProduct = data.product
				
				
			}
		}
		
		
	}
}


