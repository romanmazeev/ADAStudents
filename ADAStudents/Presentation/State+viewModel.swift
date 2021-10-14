//
//  State+viewModel.swift
//  ADAStudents
//
//  Created by Alexey Salangin on 13.10.2021.
//

extension State {
    var viewModel: ViewModel {
        switch self {
        case .start:
            return QuestionViewModel.start
        case .foundOutAboutAcademy:
            return QuestionViewModel.foundOutAboutAcademy
        case .startApplying:
            return QuestionViewModel.startApplying
        case .admissionToADA:
            return QuestionViewModel.admissionToADA
        case .sendingRequest:
            return QuestionViewModel.sendingRequest

        case .applicationWasAccepted:
            return QuestionViewModel.applicationWasAccepted
        case .timeForSubmissionIsOver:
            return QuestionViewModel.timeForSubmissionIsOver

        case .exam(let prepared):
            return QuestionViewModel.exam // TODO:
        case .interview:
            return QuestionViewModel.interview
        case .english:
            return QuestionViewModel.english
        case .invited:
            return QuestionViewModel.invited
        case .interviewFailed:
            return QuestionViewModel.interviewFailed
        case .examPreparation:
            return QuestionViewModel.examPreparation

        case .waitingLetter:
            return QuestionViewModel.waitingLetter
        case .checkLetter(_, let isSuccess):
            return isSuccess ?
                QuestionViewModel.checkLetterSuccess :
                QuestionViewModel.checkLetterFail

        case .applyForVisa:
            return QuestionViewModel.applyForVisa
        case .visaStatus(let status):
            return QuestionViewModel.visaStatus(status)
        case .visaApproved:
            return QuestionViewModel.visaApproved
        case .visaRejected:
            return QuestionViewModel.visaRejected

        case .goToNapoli:
            return QuestionViewModel.goToNapoli
        case .covidTestTime:
            return QuestionViewModel.covidTestTime
        case .noFreeCovidTests:
            return QuestionViewModel.noFreeCovidTests
        case .covidTestMoney:
            return QuestionViewModel.covidTestMoney
        case .vaccine:
            return QuestionViewModel.vaccine

        // Вставляй новые вью модели сюда

        // Finals
        case .youDidNotGetIntoADA:
            return QuestionViewModel.youDidNotGetIntoADA
        case .death:
            return QuestionViewModel.death
        }
    }
}

extension QuestionViewModel {
    static var start: Self {
        .init(
            text: "Graduate from ADA or Die!",
            attach: .image("startScreen"),
            answers: [
                .init(text: "Start", event: NoOpEvent()),
            ]
        )
    }

    static var foundOutAboutAcademy: Self {
        .init(
            text: "Вы прочитали статью об академии",
            answers: [
                .init(text: "Далее", event: NoOpEvent()),
            ]
        )
    }

    static var startApplying: Self {
        .init(
            text: "Start applying",
            attach: .image("Start applying"),
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no),
            ]
        )
    }

    static var examPreparation: Self {
        .init(
            text: "Have you prepared for the exam and interview?",
            attach: .image("preparation"),
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no),
            ]
        )
    }

    static var exam: Self {
        .init(
            text: "2 + 2 = ?",
            attach: .image("2_2"),
            answers: [
                .init(text: "4", event: BinaryModel.Event.yes),
                .init(text: "2", event: BinaryModel.Event.no),
                .init(text: "3", event: BinaryModel.Event.no),
            ]
        )
    }

    static var admissionToADA: Self {
        .init(
            text: "Admission",
            attach: .image("admission"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var sendingRequest: Self {
        .init(
            text: "Have you sent a request?",
            attach: .image("send request"),
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no)
            ]
        )
    }

    static var death: Self {
        .init(
            text: "Death",
            answers: [
                .init(text: "Restart", event: NoOpEvent()),
            ]
        )
    }

    static var applicationWasAccepted: Self {
        .init(
            text: "Your application was accepted",
            attach: .image("tick"),
            answers: [
                .init(text: "Next", event: NoOpEvent())
            ]
        )
    }

    static var timeForSubmissionIsOver: Self {
        .init(
            text: "You didn't find where to leave your application and the time for submission is over",
            attach: .image("time over"),
            answers: [
                .init(text: "Next", event: NoOpEvent())
            ]
        )
    }

    static var youDidNotGetIntoADA: Self {
        .init(
            text: "You did not get into Apple Developer Academy :c",
            attach: .image("did not get"),
            answers: [
                .init(text: "Restart", event: NoOpEvent()),
            ]
        )
    }

    static var interview: Self {
        .init(
            text: "Interview",
            attach: .image("interview"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var english: Self {
        .init(
            text: "Do you know English?",
            attach: .image("english"),
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "A little bit", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no),
            ]
        )
    }

    static var invited: Self {
        .init(
            text: "You are invited to the academy",
            attach: .image("Hoorray!!!"),
            answers: [
                .init(text: "Hooray!", event: NoOpEvent()),
            ]
        )
    }

    static var interviewFailed: Self {
        .init(
            text: "You didn't pass the interview",
            attach: .image("interview failed"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var waitingLetter: Self {
        .init(
            text: "Waiting for the letter",
            attach: .image("no letter"),
            answers: [
                .init(text: "Check letter", event: NoOpEvent()),
            ]
        )
    }

    static var checkLetterSuccess: Self {
        .init(
            text: "Letter has arrived!",
            attach: .image("1 letter"),
            answers: [
                .init(text: "Next", event: BinaryModel.Event.yes),
            ]
        )
    }

    static var checkLetterFail: Self {
        .init(
            text: "Still no letter",
            attach: .image("sad waiting"),
            answers: [
                .init(text: "Next", event: BinaryModel.Event.no),
            ]
        )
    }

    static var applyForVisa: Self {
        .init(
            text: "Apply for visa",
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static func visaStatus(_ status: VisaStatusModel.Status) -> Self {
        let text: String
        let answers: [Answer]
        let attach: QuestionViewModel.Attach?

        switch status {
        case .idle:
            text = "Чтобы проверить статус визы покрутите колесо"
            answers = []
            attach = .fortuneWheel
        case .yes:
            text = "Поздравляем, вы получили визу"
            answers = [
                .init(text: "Next", event: VisaStatusModel.Event.choose(true)),
            ]
            attach = nil // TODO: Add image
        case .no:
            text = "Вам не повезло"
            answers = [
                .init(text: "Next", event: VisaStatusModel.Event.choose(false)),
            ]
            attach = nil // TODO: Add image
        }

        return .init(
            text: text,
            attach: attach,
            answers: answers
        )
    }

    static var visaApproved: Self {
        .init(
            text: "The visa was approved",
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var visaRejected: Self {
        .init(
            text: "The visa was not approved",
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var goToNapoli: Self {
        .init(
            text: "Go to Napoli",
            attach: nil,
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var covidTestTime: Self {
        .init(
            text: "Do you have time for 48h tests on Croce Rossa?",
            attach: nil,
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no),
            ]
        )
    }

    static var noFreeCovidTests: Self {
        .init(
            text: "30.09 Croce Rossa stops making free tests",
            attach: nil,
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var covidTestMoney: Self {
        .init(
            text: "Do you have money for 48h tests in pharmacies?",
            attach: nil,
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no),
            ]
        )
    }

    static var vaccine: Self {
        .init(
            text: "Go get the vaccine",
            attach: nil,
            answers: [
                .init(text: "Go", event: NoOpEvent()),
            ]
        )
    }
}
