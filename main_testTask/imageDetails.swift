//
//  imageDetails.swift
//  main_testTask
//
//  Created by Artem on 12.12.2022.
//

import SwiftUI

struct imageDetails: View {
    var dataDrovider: CGDataProvider!
    var title:String
    var url: String
    var body: some View {
        VStack(spacing: 15){
            HStack(spacing: 10){
                Spacer()
                Button(action: {
                    share()
                }) {
                    Image("share").resizable().frame(width: 40, height: 40, alignment: .topTrailing)
                }
            }
            //Spacer()
         
            VStack{
                if #available(iOS 15.0, *) {
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .aspectRatio(contentMode: .fill)
                    //.frame(width: 200, height: 250,alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                } else {
                // Fallback on earlier versions
            }
            
            
            }//.frame(height: UIScreen.main.bounds.height / 2)
            Spacer()
            Text(title)
    }
  
    }
    func share() {
            guard let urlShare = URL(string: url) else { return }
            let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
               UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
}

struct imageDetails_Previews: PreviewProvider {
    static var previews: some View {
            imageDetails(title: "vse norm", url: "vse otlichno")
            
    }
}
