//
//  AsyncImageView.swift
//  Project10Playground
//
//  Created by Henrieke Baunack on 12/7/23.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        VStack{
            // using a scale factor
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 4)
                .frame(width: 200, height: 200)
            
            // this does not work as the AsyncImage returns a wrapper around the image that has a placeholder as well, need to unwrap it, then we can add stuff for the image only
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
//                .resizeable()
//                .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { imgage in
                imgage.resizable()
                    .scaledToFit()
            } placeholder: {
//                Color.red
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            // here we have three options, loading, loaded, error
            // above we only had loaded and loading
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                if let image = phase.image {
                    image.resizable().scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the view")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    AsyncImageView()
}
