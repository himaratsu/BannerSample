import SwiftUI
import MicrocmsSDK

struct ContentView: View {
    let client = MicrocmsClient(
        serviceDomain: "<YOUR_SERVICE_DOMAIN>",
        apiKey: "<YOUR-API-KEY>"
    )
    
    @State var banner: Banner?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if let banner = banner {
                        ImageView(url: banner.image.url)
                            .onTapGesture {
                                UIApplication.shared.open(banner.url, options: [:], completionHandler: nil)
                            }
                            .padding(.bottom, 8)
                    }
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) { // カラム数の指定
                        ForEach((1...15), id: \.self) { index in
                            GeometryReader { gr in
                                Image("\(index)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: gr.size.width)
                            }
                            .clipped()
                            .aspectRatio(1, contentMode: .fit)
                        }
                    }
                }
                .padding(.top, 16)
            }
            .navigationTitle("Gallery")
            .onAppear {
                fetch()
            }
        }
    }
    
    private func fetch() {
        client
            .get(
                endpoint: "banners") { result in
                switch result {
                case .success(let object):
                    if let object = object as? [String: Any] {
                        self.banner = Banner(dict: object)
                    } else {
                        print("Failed to parse response")
                    }
                case .failure(let error):
                    print("[ERROR] ", error)
                }
            }
    }
}
