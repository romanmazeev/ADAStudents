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
            return SimpleModel(next: .foundOutAboutAcademy)
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
            return BinaryModel(yes: .startExam(prepared: true), no: .startExam(prepared: false))
        case .startExam(let prepared):
            return SimpleModel(next: .exam(prepared: prepared))
        case .exam:
            return BinaryModel(yes: .interview, no: .youDidNotGetIntoADA)

        // MARK: Interview
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
            return VisaStatusModel(status: status, yes: .goToNapoli, no: .youDidNotGetIntoADA)

        case .goToNapoli:
            return SimpleModel(next: .covidTestTime)
        case .covidTestTime:
            return BinaryModel(yes: .noFreeCovidTests, no: .vaccine)
        case .noFreeCovidTests:
            return SimpleModel(next: .covidTestMoney(attempts: 0))
        case .covidTestMoney(let attempts):
            return CovidTestModel(attempts: attempts)
        case .testEvery48h(let attempts, let isSuccess):
            return SimpleModel(next: isSuccess ? .noMoney : .covidTestMoney(attempts: attempts))
        case .noMoney:
            return SimpleModel(next: .vaccine)
        case .vaccine:
            return SimpleModel(next: .vaccineCFInvisible(attempts: 0))
        case .vaccineCFInvisible(let attempts):
            return VaccineCFModel(attempts: attempts)
        case .vaccineFightingBureaucracy(let attempts, let isSuccess):
            return SimpleModel(next: isSuccess ? .specialDottoressa : .vaccineCFInvisible(attempts: attempts))

        case .specialDottoressa:
            return SimpleModel(next: .gotVaccine)
        case .gotVaccine:
            return SimpleModel(next: .allergic)
        case .allergic:
            return BinaryModel(yes: .death, no: .greenpass)
        case .greenpass:
            return SimpleModel(next: .greenpassCFInvisible(attempts: 0))
        case .greenpassCFInvisible(let attempts):
            return GreenpassCFModel(attempts: attempts)
        case .greenpassFightingBureaucracy(let attempts, let isSuccess):
            return SimpleModel(next: isSuccess ? .gotGreenPass : .greenpassCFInvisible(attempts: attempts))
        case .gotGreenPass:
            return SimpleModel(next: .tuesdayNight)

        case .tuesdayNight:
            return BinaryModel(yes: .strangeGuy, no: .graduated)
        case .strangeGuy:
            return BinaryModel(yes: .robbed, no: .friendsInClub)

        case .friendsInClub:
            return SimpleModel(next: .fewShots)
        case .fewShots:
            return BinaryModel(yes: .graduated, no: .graduated)

        // MARK: Final
        case .youDidNotGetIntoADA,
             .death,
             .robbed,
             .graduated:
            return SimpleModel(next: .start)
        }
    }
}
