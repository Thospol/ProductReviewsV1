

import UIKit

class HomepageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
	
	
	@IBOutlet weak var col: UICollectionView!
	let reuseIdentifier1 = "Homecell1"
	let reuseIdentifier2 = "Homecell2"
	var pushData: Product?
	var indexPath: IndexPath?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		loadSampleMeals();
	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated);	self.navigationController?.isNavigationBarHidden = true
		col?.reloadData()
	}
	//REMARK:- collectionView
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return UserModel.product.count
		
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if indexPath.item == 0 {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier1, for: indexPath as IndexPath) as! HomepageAddCollectionViewCell
			return cell
		}else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath as IndexPath) as! HomepageCollectionViewCell
			let products = UserModel.product[indexPath.row]
			cell.configureData(value: products)
			return cell
		}
	}
	
	//REMARK:-Mockdata
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
		col?.reloadData()
	}
	
	//REMARK:-SelectItemViewComtroller
	 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.navigationController?.isNavigationBarHidden = false
		print("You selected cell #\(indexPath.item)!")
		if indexPath.row == 0 {
			performSegue(withIdentifier: "AddItem", sender: nil)
		}
		else {
			pushData = UserModel.product[indexPath.row]
			self.indexPath = indexPath
			performSegue(withIdentifier: "ShowDetail", sender: nil)
		}
		
	}
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let showDet = segue.destination as? ShowDetailViewController{
			if let datas = pushData {
				showDet.productDetail = datas
				showDet.indexpathProduct = indexPath
				showDet.checkNameProduct = datas.product
			}
		}
		else{
			let ShowDetailViewController = segue.destination as? ProductDetailViewController
			if let data = pushData {
				ShowDetailViewController?.modelProduct = data
				ShowDetailViewController?.indexpathModel = indexPath
			}
		}
	}
	
	@IBAction func unwindToProductLists(sender: UIStoryboardSegue) {
		
	}
}
