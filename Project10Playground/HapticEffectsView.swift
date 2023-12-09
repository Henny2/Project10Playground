//
//  HapticEffectsView.swift
//  Project10Playground
//
//  Created by Henrieke Baunack on 12/8/23.
//

import SwiftUI

struct HapticEffectsView: View {
    
    @State private var counter = 0
    var body: some View {
        Button("TapCount \(counter)"){
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
    }
}

#Preview {
    HapticEffectsView()
}
