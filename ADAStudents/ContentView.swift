//
//  ContentView.swift
//  ADAStudents
//
//  Created by Roman Mazeev on 13/10/21.
//

import SwiftUI

struct Answer: Hashable {
    let title: String
}

let answers: [Answer] = [
    .init(title: "www"),
    .init(title: "asd"),
    .init(title: "rrr")
]

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to ADA student jorney")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()

            Image("image2")
                .resizable()
                .aspectRatio(contentMode: .fit)

            Spacer()

            ForEach(answers, id: \.self) { answer in
                Button(answer.title) {
                    print("\(answer.title) button pressed")
                }
                .buttonStyle(AnswerButtonStyle())
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
