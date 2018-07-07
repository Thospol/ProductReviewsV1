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
		let photo = UIImage(named: "add")
		let photo1 = UIImage(named: "product1")!
		let photo2 = UIImage(named: "product2")!
		let photo3 = UIImage(named: "product3")!
		let addproduct1 = Product(product: "กาแฟอราบิกาคั่วกลาง", photo: photo, desc: "", price: 180)
		let addproduct2 = Product(product: "กาแฟอราบิกาคั่วกลาง", photo: photo1, desc: "กาแฟอาราบิก้าคั่วกลาง แบบเมล็ด ขนาด 250 กรัม รสชาติกลมกล่อม กลิ่นหอม ยังคงความเป็นผลไม้และความสดชื่น เงื่อนไขการสั่งสินค้า/ คำแนะนำ สินค้าซื้อแล้วไม่สามารถปรับ เปลี่ยน หรือคืนได้ ยกเว้น สินค้าชำรุด/เสียหาย ไม่เป็นไปตามรูปที่แสดงเท่านั้น จัดจำหน่ายและจัดส่งโดย Abonzo Coffee. สอบถามข้อมูลเพิ่มเติมเกี่ยวกันสินค้า ติดต่อ คุณภัทรชัย 091-070-7272", price: 180)
		
		let addproduct3 = Product(product: "กาแฟอราบิกาคั่วอ่อน", photo: photo2, desc: "ไม่มีข้อมูล", price: 200)
		let addproduct4 = Product(product: "กาแฟอราบิกาคั่วเข้ม", photo: photo3, desc: "ไม่มีข้อมูล", price: 200)
		UserModel.product.append(addproduct1)
		UserModel.product.append(addproduct2)
		UserModel.product.append(addproduct3)
		UserModel.product.append(addproduct4)
		collectionView?.reloadData()
	}
	
	@IBAction func unwindToProductList(sender: UIStoryboardSegue) {
		
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {//เมื่อกดเลือก collectionviewสักอัน
		print("You selected cell #\(indexPath.item)!")
		if indexPath.row == 0 {
			performSegue(withIdentifier: "AddItem", sender: nil)
		}
		else {
			pushData = UserModel.product[indexPath.row] //row เท่ากับ 1
			self.indexPath = indexPath //กำหนดindexpath เพื่อส่งindexไปยังหน้าที่เราsegue
			performSegue(withIdentifier: "ShowDetail", sender: nil) //วิ่งไปยัง seque ที่indentified ShowDetail แต่่มันจะไปทำprepareอิกทีเพื่อส่งข้อมูลไปยังหน้า controllerที่เราsegueไป
		}
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //การแสดงผล
		super.prepare(for: segue, sender: sender)
		
		
			 if let showDet = segue.destination as? ShowDetailViewController{
				if let datas = pushData {
					showDet.productDetail = datas
					showDet.indexpathProduct = indexPath
					showDet.checkNameProduct = datas.product
				}
			}
			else{
				
				let ShowDetailViewController = segue.destination as? ProductDetailViewController  //อ้างอิงไปยัง segue ของ ShowDetailViewController
					if let data = pushData {
						ShowDetailViewController?.modelProduct = data //ส่งdataไปยัง controlellerที่segue
						ShowDetailViewController?.indexpathModel = indexPath //ส่งindexpathไปยังcontrollerที่seguaหา
						//ShowDetailViewController.checkNameProduct = data.product
						
						
					}
				
		}
		
			
	
		
		
	}
	
}


