//
//  UIKitSliderRepresentable.swift
//  SliderGame
//
//  Created by Данис Гаязов on 21.10.24..
//

import SwiftUI

struct UIKitSliderRepresentable: UIViewRepresentable {
    
    @Binding var value: Double
    var transparency: CGFloat
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(transparency/100)
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor.red.withAlphaComponent(transparency/100)
        slider.value = Float(value)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        return slider
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: UIKitSliderRepresentable
        
        init(_ parent: UIKitSliderRepresentable) {
            self.parent = parent
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            let step: Float = 1.0
            let roundedValue = round(sender.value / step) * step
            sender.value = roundedValue
            parent.value = Double(sender.value)
        }
    }
}
