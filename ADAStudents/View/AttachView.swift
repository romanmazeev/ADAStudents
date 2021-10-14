//
//  AttachView.swift
//  ADAStudents
//
//  Created by Roman Mazeev on 14/10/21.
//

import SwiftUI
import FortuneWheel

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
            let titles = [[String]](repeating: ["Yes", "No"], count: 4).flatMap { $0 }
            FortuneWheel(
                titles: titles,
                size: .init(250)
            ) { resultIndex in
                self.callback(VisaStatusModel.Event.spin(titles[resultIndex] == "Yes"))
            }
        case nil:
            EmptyView()
        }
    }
}

struct AttachView_Previews: PreviewProvider {
    static var previews: some View {
        AttachView(attach: .fortuneWheel, callback: { _ in })
    }
}

