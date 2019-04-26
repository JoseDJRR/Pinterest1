import UIKit

private let reuseIdentifier = "Cell"
private let sectionInsets = UIEdgeInsets(top: 50.0,
                                         left: 20.0,
                                         bottom: 50.0,
                                         right: 20.0)
var collectionView: UICollectionView?
var screenSize: CGRect!
var screenWidth: CGFloat!
var screenHeight: CGFloat!

class collectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        self.navigationItem.title = "Bienvenido a Pinterest"

        //Boton de retroceder
        let backButton = UIBarButtonItem()
        backButton.title = "Atras"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        view.backgroundColor = .white        
        collectionView?.register(PinCell.self, forCellWithReuseIdentifier: "Pin")

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth/2, height: screenWidth/2);
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Pin", for: indexPath) as! PinCell
        return cell
    }
}
class PinCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
    }
    let imageView1 : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"pinterest")
        return img
    }()
    func setupViews(){
        self.addSubview(imageView1)
        self.backgroundColor = .white
        imageView1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 9/10).isActive = true
        imageView1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 4/5).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}