//
//  State+model.swift
//  ADAStudents
//
//  Created by Alexey Salangin on 14.10.2021.
//

extension State {
    var model: StateModel {
        switch self {
        case .start:
            return StartModel()
        case .foundOutAboutAcademy:
            return SimpleModel(next: .startApplying)
        case .startApplying:
            return BinaryModel(yes: .admissionToADA, no: .youDidNotGetIntoADA)
        case .admissionToADA:
            return SimpleModel(next: .sendingRequest)
        case .sendingRequest:
            return BinaryModel(yes: .applicationWasAccepted, no: .timeForSubmissionIsOver)

        case .applicationWasAccepted:
            return SimpleModel(next: .examPreparation)
        case .timeForSubmissionIsOver:
            return SimpleModel(next: .youDidNotGetIntoADA)

        case .examPreparation:
            return BinaryModel(yes: .exam(prepared: true), no: .exam(prepared: false))
        case .exam:
            return BinaryModel(yes: .interview, no: .youDidNotGetIntoADA)

        case .interview:
            return SimpleModel(next: .english)
        case .english:
            return BinaryModel(yes: .invited, no: .interviewFailed)
        case .invited:
            return SimpleModel(next: .waitingLetter(attempts: 0))
        case .interviewFailed:
            return SimpleModel(next: .youDidNotGetIntoADA)

        case .waitingLetter(let attempts):
            return WaitingLetterModel(attempts: attempts)
        case .checkLetter(let attempts, _):
            return BinaryModel(yes: .applyForVisa, no: .waitingLetter(attempts: attempts))

        case .applyForVisa:
            return SimpleModel(next: .visaStatus(.idle))
        case .visaStatus(let status):
            return VisaStatusModel(status: status, yes: .visaApproved, no: .visaRejected)
        case .visaApproved:
            return SimpleModel(next: .goToNapoli)
        case .visaRejected:
            return SimpleModel(next: .youDidNotGetIntoADA)

        case .goToNapoli:
            return SimpleModel(next: .covidTestTime)
        case .covidTestTime:
            return BinaryModel(yes: .noFreeCovidTests, no: .vaccine)
        case .noFreeCovidTests:
            return SimpleModel(next: .covidTestMoney)
        case .covidTestMoney:
            return BinaryModel(yes: .death, no: .death) // TODO:
        case .vaccine:
            return SimpleModel(next: .death) // TODO:

        // Final
        case .youDidNotGetIntoADA:
            return StartModel()
        case .death:
            return StartModel()
        }
    }
}
