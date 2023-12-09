//
//  ContentView.swift
//  Project10Playground
//
//  Created by Henrieke Baunack on 12/7/23.
//

import SwiftUI

// use of URLSession, Codable

struct Response: Codable {
    var results : [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}


struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading){
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }.task {
            await loadData()
        }
    }
    // loading data from API
    // onPerform cannot handle async functions
    // we have to use TASKS, which can call "sleeping functions"
    func loadData() async {
        
        // 1. create URL
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        // 2. fetch data from URL
        do {
            // URLSession returns tuple of (data, metadata)
            // we are discarding the metadata here
            let (data, _) = try await URLSession.shared.data(from: url)
//            print(data)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                results = decodedResponse.results
                print(results)
            }
            else {
                print("Failed to decode data")
            }
        }
        catch {
            print("Invalid Data")
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
