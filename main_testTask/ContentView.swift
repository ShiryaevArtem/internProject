//
//  ContentView.swift
//  main_testTask
//
//  Created by Artem on 11.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
                boxView()
                .navigationTitle("Photos")
        }
        
    }
}


struct boxView: View{
    @State var posts: [Post] = []
    private var columns: [GridItem] = [
        GridItem(.fixed(120), spacing: 5),
        GridItem(.fixed(120), spacing: 5),
        GridItem(.fixed(120), spacing: 5)
        ]
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 10,
                pinnedViews: [.sectionHeaders]
            ) {
                        
                Section(header: Text("").font(.title)) {
                    ForEach(posts) { post in
                        NavigationLink( destination: imageDetails(title: post.title, url: post.url)){
                            
                                if #available(iOS 15.0, *) {
                                    
                                    AsyncImage( url: URL(string: post.thumbnailUrl)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.gray
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    //.frame(width: 100, height: 100,alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    } else {
                                    // Fallback on earlier versions
                                    }
                                    
                                }
                            }
                            
                        }.onAppear(){
                            
                            API().getPhoto { (posts) in
                                self.posts = posts
                                }
                            
                          }
                        
                        }

                    }
        
                }
    
}
        //HStack{
            /*List(posts) { post in
            
                if #available(iOS 15.0, *) {
                    AsyncImage( url: URL(string: post.thumbnailUrl)).lineLimit(nil)
                    
                } else {
                    // Fallback on earlier versions
                }
            }*/
        
        //}.onAppear(){
          //  API().getPhoto { (posts) in
            //    self.posts = posts
              //  }
        //}
    
   




struct Post:Codable,Identifiable{
    let id = UUID()
    var title: String
    var url: String
    var thumbnailUrl: String
}







class API {
    func getPhoto(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
            else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
    .resume()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
