import UIKit

class pinC: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    let imageView1 : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pinterest")
        return image
    }()
    
    let label1 : UILabel = {
        let label2 = UILabel()
        label2.textColor = .black
        label2.translatesAutoresizingMaskIntoConstraints = false
        return label2
    }()

    let imageViewOptions : UIImageView = {
        let imageView3 = UIImageView()
        imageView3.image = #imageLiteral(resourceName: "3Puntos")
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        return imageView3
    }()

    func setupViews(){
        self.addSubview(imageView1)

        imageView1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 9/10).isActive = true
        imageView1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 4/5).isActive = true
        label1.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: (17 / 3 )).isActive = true
        label1.leftAnchor.constraint(equalTo: imageView1.leftAnchor).isActive = true
        label1.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 80/100).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 17).isActive = true
        self.addSubview(imageViewOptions)
        imageViewOptions.centerYAnchor.constraint(equalTo: label1.centerYAnchor).isActive = true
        imageViewOptions.rightAnchor.constraint(equalTo: imageView1.rightAnchor).isActive = true
        imageViewOptions.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        imageViewOptions.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 7/100).isActive = true
        self.backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
