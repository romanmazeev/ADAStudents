//
//  State.swift
//  ADAStudents
//
//  Created by Alexey Salangin on 13.10.2021.
//

enum State {
    case start
    case foundOutAboutAcademy
    case startApplying
    case admissionToADA
    case sendingRequest
    case applicationWasAccepted
    case timeForSubmissionIsOver
    case examPreparation
    case exam(prepared: Bool)
    case interview
    case english
    case invited
    case interviewFailed
    case waitingLetter(attempts: Int)
    case checkLetter(attempts: Int, isSuccess: Bool)
    case applyForVisa
    case visaStatus(VisaStatusModel.Status)
    case visaApproved
    case visaRejected
    case goToNapoli
    case covidTestTime
    case noFreeCovidTests
    case covidTestMoney
    case vaccine

    // Finals
    case youDidNotGetIntoADA
    case death
}
