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

        case .examPreparation:
            return QuestionViewModel.examPreparation
        case .startExam:
            return QuestionViewModel.startExam
        case .exam(let prepared):
            return prepared ? QuestionViewModel.examEasy : QuestionViewModel.examHard

        case .interview:
            return QuestionViewModel.interview
        case .english:
            return QuestionViewModel.english
        case .invited:
            return QuestionViewModel.invited
        case .interviewFailed:
            return QuestionViewModel.interviewFailed

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

        case .goToNapoli:
            return QuestionViewModel.goToNapoli
        case .covidTestTime:
            return QuestionViewModel.covidTestTime
        case .noFreeCovidTests:
            return QuestionViewModel.noFreeCovidTests
        case .covidTestMoney:
            return QuestionViewModel.covidTestMoney
        case .testEvery48h:
            return QuestionViewModel.testEvery48h
        case .noMoney:
            return QuestionViewModel.noMoney
        case .vaccine:
            return QuestionViewModel.vaccine

        case .vaccineCFInvisible:
            return QuestionViewModel.vaccineCFInvisible
        case .vaccineFightingBureaucracy:
            return QuestionViewModel.vaccineFightingBureaucracy
        case .specialDottoressa:
            return QuestionViewModel.specialDottoressa
        case .gotVaccine:
            return QuestionViewModel.gotVaccine
        case .allergic:
            return QuestionViewModel.allergic
        case .greenpass:
            return QuestionViewModel.greenpass
        case .greenpassCFInvisible:
            return QuestionViewModel.greenpassCFInvisible
        case .greenpassFightingBureaucracy:
            return QuestionViewModel.greenpassFightingBureaucracy
        case .gotGreenPass:
            return QuestionViewModel.gotGreenPass
        case .tuesdayNight:
            return QuestionViewModel.tuesdayNight
        case .strangeGuy:
            return QuestionViewModel.strangeGuy
        case .robbed:
            return QuestionViewModel.robbed
        case .friendsInClub:
            return QuestionViewModel.friendsInClub
        case .fewShots:
            return QuestionViewModel.fewShots

        // Finals
        case .youDidNotGetIntoADA:
            return QuestionViewModel.youDidNotGetIntoADA
        case .death:
            return QuestionViewModel.death
        case .graduated:
            return QuestionViewModel.graduated
        }
    }
}

extension QuestionViewModel {
    static var start: Self {
        .init(
            text: "Graduate from ADA or die!",
            attach: .image("startScreen"),
            answers: [
                .init(text: "Start", event: NoOpEvent()),
            ]
        )
    }

    static var foundOutAboutAcademy: Self {
        .init(
            text: "You have read the article about Apple Developer Academy.",
            attach: .image("article"),
            answers: [
                .init(text: "I want to study there!", event: NoOpEvent()),
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

    static var startExam: Self {
        .init(
            text: "The exam has started",
            attach: .image("exam"),
            answers: [
                .init(text: "Go", event: NoOpEvent())
            ]
        )
    }

    static var examEasy: Self {
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

    static var examHard: Self {
        .init(
            text: "How many reference counters are there in the Swift class?",
            attach: .image("reference_counters"),
            answers: [
                .init(text: "1", event: BinaryModel.Event.no),
                .init(text: "2", event: BinaryModel.Event.no),
                .init(text: "3", event: BinaryModel.Event.yes),
            ]
        )
    }

    static var admissionToADA: Self {
        .init(
            text: "Admission to ADA",
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
            attach: .image("skull"),
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
            attach: .image("bureaucracy"),
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
            text = "Rotate the wheel to check visa status"
            answers = []
            attach = .fortuneWheel
        case .yes:
            text = "Congratulations! You got your visa!"
            attach = .image("visa")
            answers = [
                .init(text: "Next", event: VisaStatusModel.Event.choose(true)),
            ]
        case .no:
            text = "Life is a bitch. Visa denied"
         
            answers = [
                .init(text: "Next", event: VisaStatusModel.Event.choose(false)),
            ]
            attach = .image("bear")
        }

        return .init(
            text: text,
            attach: attach,
            answers: answers
        )
    }

    static var goToNapoli: Self {
        .init(
            text: "Go to Napoli",
            attach: .image("plane"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var covidTestTime: Self {
        .init(
            text: "Do you have time for 48h tests on Croce Rossa?",
            attach: .image("time croce rossa"),
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no),
            ]
        )
    }

    static var noFreeCovidTests: Self {
        .init(
            text: "30.09 Croce Rossa stops making free tests",
            attach: .image("stop croce"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var covidTestMoney: Self {
        .init(
            text: "Do you have money for 48h tests in pharmacies?",
            attach: .image("money pharmacy"),
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no),
            ]
        )
    }

    static var testEvery48h: Self {
        .init(
            text: "Make test every 48h",
            attach: .image("every 48h"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var noMoney: Self {
        .init(
            text: "Money have finished",
            attach: .image("money finished"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var vaccine: Self {
        .init(
            text: "Go get the vaccine",
            attach: .image("vax"),
            answers: [
                .init(text: "Go", event: NoOpEvent()),
            ]
        )
    }

    static var vaccineCFInvisible: Self {
        .init(
            text: "Your CF isn’t visible in the system",
            attach: .image("no cf"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var vaccineFightingBureaucracy: Self {
        .init(
            text: "Continue fighting bureaucracy",
            attach: .image("fight"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }
    static var specialDottoressa: Self {
        .init(
            text: "Get an appointment with special dottoressa",
            attach: .image("dottoressa"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var gotVaccine: Self {
        .init(
            text: "You got the vaccine",
            attach: .image("vax"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var allergic: Self {
        .init(
            text: "Are you allergic to the vaccine?",
            attach: .image("allergic_"),
            answers: [
                .init(text: "Yes", event: BinaryModel.Event.yes),
                .init(text: "No", event: BinaryModel.Event.no),
            ]
        )
    }

    static var greenpass: Self {
        .init(
            text: "Go get your Greenpass",
            attach: .image("greenpass"),
            answers: [
                .init(text: "Go", event: NoOpEvent()),
            ]
        )
    }

    static var greenpassCFInvisible: Self {
        .init(
            text: "Your CF isn’t visible in the system",
            attach: .image("no cf"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var greenpassFightingBureaucracy: Self {
        .init(
            text: "Start figting bureaucracy again",
            attach: .image("fight"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var gotGreenPass: Self {
        .init(
            text: "FINALLY get your greenpass",
            attach: .image("greenpass"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var tuesdayNight: Self {
        .init(
            text: "What to do on a Tuesday night",
            attach: .image("tuesday"),
            answers: [
                .init(text: "Go to the club", event: BinaryModel.Event.yes),
                .init(text: "Go to sleep", event: BinaryModel.Event.no),
            ]
        )
    }

    static var strangeGuy: Self {
        .init(
            text: "You came to club and strange guy and He offered to take his car for a ride",
            attach: .image("car"),
            answers: [
                .init(text: "Take a ride", event: BinaryModel.Event.yes),
                .init(text: "Decline his offer", event: BinaryModel.Event.no),
            ]
        )
    }

    static var robbed: Self {
        .init(
            text: "He brought you to a place where there are no people and robbed you.",
            attach: .image("robber"),
            answers: [
                .init(text: "Play again", event: NoOpEvent()),
            ]
        )
    }

    static var friendsInClub: Self {
        .init(
            text: "You go inside the club, there you see your friends from the Apple developer academy",
            attach: .image("friends"),
            answers: [
                .init(text: "Next", event: NoOpEvent()),
            ]
        )
    }

    static var fewShots: Self {
        .init(
            text: "They offer you a few shots of tequila",
            attach: .image("shots"),
            answers: [
                .init(text: "Don’t drink and be fresh naxt morning", event: BinaryModel.Event.yes),
                .init(text: "Drink them, get overcreative and make a cool app", event: BinaryModel.Event.no),
            ]
        )
    }

    static var graduated: Self {
        .init(
            text: "You successfully graduated from the academy",
            attach: .image("graduation"),
            answers: [
                .init(text: "Play again", event: NoOpEvent()),
            ]
        )
    }
}
