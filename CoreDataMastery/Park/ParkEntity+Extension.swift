import UIKit

extension ParkEntity {
    var image: UIImage {
        get {
            if let data = image_, let image = UIImage(data: data) {
                return image
            } else {
                return UIImage(systemName: "photo")!
            }
        }
        set {
            let data = newValue.jpegData(compressionQuality: 1.0)
            image_ = data
        }
    }
    
    var name: String {
        get {
            name_ ?? "N/A"
        }
        set {
            name_ = newValue
        }
    }
    
    @objc var country: String {
        get {
            country_ ?? "N/A"
        }
        set {
            country_ = newValue
        }
    }
    
    var region: String {
        get {
            region_ ?? "N/A"
        }
        set {
            region_ = newValue
        }
    }
    
    var location: String {
        "\(region), \(country)"
    }
    
    var viewRating: String {
        "\(rating_).circle.fill"
    }
    
    var rating: Int {
        get {
            Int(rating_)
        }
        set {
            rating_ = Int16(newValue)
        }
    }
}
