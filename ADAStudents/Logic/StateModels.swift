//
//  StateModels.swift
//  ADAStudents
//
//  Created by Alexey Salangin on 13.10.2021.
//

protocol StateModel {
    func next(with event: ADAEvent) -> State
}

struct SimpleModel: StateModel {
    let next: State

    func next(with event: ADAEvent) -> State {
        next
    }
}

struct BinaryModel: StateModel {
    enum Event: ADAEvent {
        case yes, no
    }

    let yes: State
    let no: State

    func next(with event: ADAEvent) -> State {
        guard let event = event as? Event else { assertionFailure(); return no }
        switch event {
        case .yes: return yes
        case .no: return no
        }
    }
}

struct WaitingLetterModel: StateModel {
    let attempts: Int

    func next(with event: ADAEvent) -> State {
        guard event is NoOpEvent else { assertionFailure(); return .waitingLetter(attempts: attempts) }

        let newAttempts = attempts + 1
        let totalAttempts = 3
        return .checkLetter(attempts: newAttempts, isSuccess: newAttempts >= totalAttempts)
    }
}

struct VaccineCFModel: StateModel {
    let attempts: Int

    func next(with event: ADAEvent) -> State {
        guard event is NoOpEvent else { assertionFailure(); return .vaccineCFInvisible(attempts: attempts) }

        let newAttempts = attempts + 1
        let totalAttempts = 3
        return .vaccineFightingBureaucracy(attempts: newAttempts, isSuccess: newAttempts >= totalAttempts)
    }
}

struct GreenpassCFModel: StateModel {
    let attempts: Int

    func next(with event: ADAEvent) -> State {
        guard event is NoOpEvent else { assertionFailure(); return .greenpassCFInvisible(attempts: attempts) }

        let newAttempts = attempts + 1
        let totalAttempts = 3
        return .greenpassFightingBureaucracy(attempts: newAttempts, isSuccess: newAttempts >= totalAttempts)
    }
}

struct CovidTestModel: StateModel {
    let attempts: Int

    func next(with event: ADAEvent) -> State {
        guard let event = event as? BinaryModel.Event else {
            assertionFailure()
            return .covidTestMoney(attempts: attempts)
        }

        switch event {
        case .yes:
            let newAttempts = attempts + 1
            let totalAttempts = 3
            return .testEvery48h(attempts: newAttempts,  isSuccess: newAttempts >= totalAttempts)
        case .no:
            return .vaccine
        }
    }
}

struct VisaStatusModel: StateModel {
    enum Event: ADAEvent {
        case spin(Bool)
        case choose(Bool)
    }

    enum Status {
        case idle
        case yes
        case no
    }

    let status: Status
    let yes: State
    let no: State

    func next(with event: ADAEvent) -> State {
        guard let event = event as? Event else { assertionFailure(); return no }
        switch event {
        case .spin(let result):
            let status = result ? Status.yes : .no
            return State.visaStatus(status)
        case .choose(let result):
            return result ? yes : no
        }
    }
}
