//
//  QuestionView.swift
//  ADAStudents
//
//  Created by Alexey Salangin on 13.10.2021.
//

import SwiftUI

struct QuestionView: View {
    let viewModel: QuestionViewModel
    let callback: (ADAEvent) -> Void

    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.text)
                .font(.largeTitle.weight(.heavy))
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
            Spacer()

            AttachView(attach: viewModel.attach, callback: callback)

            Spacer(minLength: 16)

            ForEach(viewModel.answers, id: \.text) { answer in
                Button(answer.text) {
                    callback(answer.event)
                }
                .buttonStyle(AnswerButtonStyle())
            }
        }
        .padding()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(viewModel: .init(text: "Test", attach: .image("image1"), answers: []), callback: { _ in })
    }
}
