//
//  AnswerButtonStyle.swift
//  ADAStudents
//
//  Created by Roman Mazeev on 13/10/21.
//

import SwiftUI

struct AnswerButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.accentColor)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .foregroundColor(.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
            )
    }
}

struct AnswerButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("example") {
        }
        .buttonStyle(AnswerButtonStyle())
    }
}
