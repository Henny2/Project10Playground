//
//  ValidateFormView.swift
//  Project10Playground
//
//  Created by Henrieke Baunack on 12/7/23.
//

import SwiftUI

struct ValidateFormView: View {
    @State private var username = ""
    @State private var email = ""
    var disabledButton: Bool {
        return username == "" || email == ""
    }
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $username)
                TextField("Email", text: $email)
            }
            Section{
                Button("Submit"){
                    print("Submitted!")
                }
            }
            .disabled(disabledButton)
//            .disabled(username == "" || email == "")
        }
    }
}

#Preview {
    ValidateFormView()
}
