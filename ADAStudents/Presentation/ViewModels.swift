//
//  ViewModels.swift
//  ADAStudents
//
//  Created by Alexey Salangin on 13.10.2021.
//

protocol ViewModel {}

struct QuestionViewModel: ViewModel {
    struct Answer {
        let text: String
        let event: ADAEvent
    }

    enum Attach {
        case image(String)
        case fortuneWheel
    }

    let text: String
    let attach: Attach?
    let answers: [Answer]

    init(text: String, attach: Attach? = nil, answers: [Answer]) {
        self.text = text
        self.attach = attach
        self.answers = answers
    }
}

struct WelcomeViewModel: ViewModel {}
