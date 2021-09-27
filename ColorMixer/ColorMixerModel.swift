//
//  ColorMixerModel.swift
//  ColorMixer
//
//

import Foundation
import UIKit

extension UIColor {
    
    func lerp(from a: CGFloat, to b: CGFloat, alpha: CGFloat) -> CGFloat {
        return (1 - alpha) * a + alpha * b
    }
    
    func components() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        return (r, g, b, a)
    }
    
    func combine(with color: UIColor, amount: CGFloat) -> UIColor {
            let fromComponents = components()

            let toComponents = color.components()

            let redAmount = lerp(from: fromComponents.red,
                                   to: toComponents.red,
                                alpha: amount)
            let greenAmount = lerp(from: fromComponents.green,
                                     to: toComponents.green,
                                  alpha: amount)
            let blueAmount = lerp(from: fromComponents.blue,
                                    to: toComponents.blue,
                                 alpha: amount)


            let color = UIColor(red: redAmount,
                                green: greenAmount,
                                blue: blueAmount,
                                alpha: 1)

            return color
        }
}

class ColorGuess: ObservableObject {
    @Published var currColor: UIColor
    @Published var targetColor: UIColor
    @Published var score = 0
    @Published var visibleTutorial: Bool = false
    @Published var visibleGO: Bool = false
    @Published var checks = 5
    @Published var difficulty = 1
    @Published var range = 0.05
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var timeRemaining = 30

    
    init() {
        targetColor = UIColor(red: CGFloat(Int.random(in: 0..<250)) / 250,
                              green: CGFloat(Int.random(in: 0..<250)) / 250,
                              blue: CGFloat(Int.random(in: 0..<250)) / 250,
                              alpha: 1)
        currColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        visibleTutorial = true
        timeRemaining = 30
    }
    
    //easy, medium, hard = 1, 2, 3 respectively
    func newgame(){
        targetColor = UIColor(red: CGFloat(Int.random(in: 0..<250)) / 250,
                              green: CGFloat(Int.random(in: 0..<250)) / 250,
                              blue: CGFloat(Int.random(in: 0..<250)) / 250,
                              alpha: 1)
        currColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        score = 0
        checks = 5
        visibleGO = false
        
        if difficulty == 1 {
            range = 0.2
            timeRemaining = 30
        }else if difficulty == 2 {
            range = 0.15
            timeRemaining = 20
        }else if difficulty == 3 {
            range = 0.1
            timeRemaining = 15
        }
    }
    
    func mix(color: UIColor) {
        currColor = currColor.combine(with: color, amount: 0.05)
    }
    
    func check(){
        if ((Double(abs(currColor.components().red - targetColor.components().red)) <= range) &&
            (Double(abs(currColor.components().green - targetColor.components().green)) <= range) &&
            (Double(abs(currColor.components().blue - targetColor.components().blue)) <= range)) {
            score += Int(100*abs(currColor.components().red - targetColor.components().red))
            score += Int(100*abs(currColor.components().green - targetColor.components().green))
            score += Int(100*abs(currColor.components().blue - targetColor.components().blue))
        }else{
            checks -= 1
        }
        
        if checks == 0 {
            visibleGO = true
        }else{
            targetColor = UIColor(red: CGFloat(Int.random(in: 0..<250)) / 250,
                                  green: CGFloat(Int.random(in: 0..<250)) / 250,
                                  blue: CGFloat(Int.random(in: 0..<250)) / 250,
                                  alpha: 1)
            currColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            if difficulty == 1 {
                timeRemaining = 30
            }else if difficulty == 2 {
                timeRemaining = 20
            }else if difficulty == 3 {
                timeRemaining = 15
            }
        }
    }
    
    func addRed() {
        mix(color: UIColor.red)
    }
    
    func addGreen() {
        mix(color: UIColor.green)
    }
    
    func addBlue() {
        mix(color: UIColor.blue)
    }
}
