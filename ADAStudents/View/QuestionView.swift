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
            Text(viewModel.text)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()

            AttachView(attach: viewModel.attach, callback: callback)

            Spacer()

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

struct AttachView: View {
    let attach: QuestionViewModel.Attach?
    let callback: (ADAEvent) -> Void

    var body: some View {
        switch attach {
        case .image(let imageName):
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        case .fortuneWheel:
            Button("Это типа колесо") {
                self.callback(VisaStatusModel.Event.spin(Bool.random()))
            }
        case nil: // TODO:
//            EmptyView()
            Image("image2")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
