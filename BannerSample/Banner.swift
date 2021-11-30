import Foundation
import SwiftUI

struct Banner {
    let image: BannerImage
    let url: URL
    
    init?(dict: [String: Any]) {
        if let imageDict = dict["image"] as? [String: Any],
           let image = BannerImage(dict: imageDict),
           let urlString = dict["url"] as? String,
           let url = URL(string: urlString) {
            self.image = image
            self.url = url
        } else {
            return nil
        }
    }
}

struct BannerImage {
    let url: URL
    let width: Double
    let height: Double

    init?(dict: [String: Any]) {
        if let urlString = dict["url"] as? String,
           let url = URL(string: urlString),
           let width = dict["width"] as? Double,
           let height = dict["height"] as? Double {
            self.url = url
            self.width = width
            self.height = height
        } else {
            return nil
        }
    }
}
