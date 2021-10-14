//
//  ContentView.swift
//  ADAStudents
//
//  Created by Roman Mazeev on 13/10/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject
    private var fsm = FSM(initialState: .start)

    var viewModel: ViewModel {
        fsm.currentState.viewModel
    }

    var body: some View {
        HStack {
            switch viewModel {
            case let questionViewModel as QuestionViewModel:
                QuestionView(viewModel: questionViewModel) { event in
                    fsm.fire(event: event)
                }
            default:
                Rectangle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
