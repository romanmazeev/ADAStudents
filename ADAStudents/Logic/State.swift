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
    case startExam(prepared: Bool)
    case exam(prepared: Bool)
    case interview
    case english
    case invited
    case interviewFailed
    case waitingLetter(attempts: Int)
    case checkLetter(attempts: Int, isSuccess: Bool)
    
    case applyForVisa
    case visaStatus(VisaStatusModel.Status)

    case goToNapoli
    case covidTestTime
    case noFreeCovidTests
    case covidTestMoney(attempts: Int)
    case testEvery48h(attempts: Int, isSuccess: Bool)
    case noMoney

    case vaccine
    case vaccineCFInvisible(attempts: Int)
    case vaccineFightingBureaucracy(attempts: Int, isSuccess: Bool)
    case specialDottoressa
    case gotVaccine
    case allergic

    case greenpass
    case greenpassCFInvisible(attempts: Int)
    case greenpassFightingBureaucracy(attempts: Int, isSuccess: Bool)
    case gotGreenPass

    case tuesdayNight
    case strangeGuy
    case robbed
    case friendsInClub
    case fewShots

    // Finals
    case youDidNotGetIntoADA
    case death
    case graduated
}
