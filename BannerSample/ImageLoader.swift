import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image = UIImage()
    
    init(url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)!
            }
        }
        task.resume()
    }
}