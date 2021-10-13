//
//  WelcomeView.swift
//  ADAStudents
//
//  Created by Roman Mazeev on 13/10/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to ADA student jorney")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Let's start") {
                print("123")
            }
            .buttonStyle(AnswerButtonStyle())
        }
        .background(
            Image("poster2")
                .resizable()
                .aspectRatio(contentMode: .fit)
        )
        .padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
