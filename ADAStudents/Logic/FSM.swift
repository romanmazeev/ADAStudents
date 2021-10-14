//
//  FSM.swift
//  ADAStudents
//
//  Created by Alexey Salangin on 13.10.2021.
//

import Foundation

final class FSM: ObservableObject {
    @Published
    var currentState: State

    init(initialState: State) {
        self.currentState = initialState
    }

    func fire(event: ADAEvent) {
        self.currentState = self.currentState.model.next(with: event)
    }
}
