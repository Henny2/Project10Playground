//
//  CodableObservableObject.swift
//  Project10Playground
//
//  Created by Henrieke Baunack on 12/8/23.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey{
        case _name = "name"
//        case _$observationRegistrar = "WHAT"
    }
    
    var name = "Taylor"
}

struct CodableObservableObjectView: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        
        // encoding an instace of User here
        let data = try! JSONEncoder().encode(User())
        // stringifying the JSON that is the encoded result of the object instance
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    CodableObservableObjectView()
}
