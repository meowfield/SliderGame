//
//  ContentView.swift
//  SliderGame
//
//  Created by Данис Гаязов on 20.10.24..
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue: Double = 0
    @State private var targetValue = round(Double(Int.random(in: 0..<100)))
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Подвинь слайдер на \(Int(targetValue))")
                .font(.title)
            UIKitSliderRepresentable(value: $currentValue, transparency: CGFloat(computeScore()))
            
            Spacer()
            
            Button("Проверь меня") {
                showAlert = true
            }
            .alert("Ваш счет: \(Int(currentValue))", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
            
            Button("Начать заново") {
                targetValue = round(Double(Int.random(in: 0..<100)))
            }
            Spacer()
            
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(Int(targetValue) - lround(currentValue))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}

