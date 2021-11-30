import SwiftUI

struct BannerView: View {
    var body: some View {

        // ここから変更 --------------
       
        // -------------- ここまで

            .padding(12)
            .navigationTitle("バナー")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                fetchBanner()
            }
    }
}
