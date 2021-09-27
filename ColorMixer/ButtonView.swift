//
//  ButtonView.swift
//  ColorMixer
//
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var colorGuesser: ColorGuess
    @State private var easyEnabled = true
    @State private var mediumEnabled = false
    @State private var hardEnabled = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Red") {
                    redButton()
                }
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color.red)
                .clipShape(Circle())
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                Button("Green") {
                    greenButton()
                }
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color.green)
                .clipShape(Circle())
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                Button("Blue") {
                    blueButton()
                }
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(Circle())
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                Button("Skip") {
//                    colorGuesser.newgame()
//                }
//                .frame(width: 75, height: 75)
//                .foregroundColor(Color.black)
//                .background(Color.white)
//                .clipShape(Circle())
//                .padding()
//                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            HStack {
                Button(action: easy, label: {
                    Text("Easy")
                        .fontWeight(easyEnabled ? .bold : .none)
                        .scaleEffect(easyEnabled ? 1.10 : 1)
                })
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color.orange)
                .clipShape(Circle())
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Button(action: medium, label: {
                    Text("Medium")
                        .fontWeight(mediumEnabled ? .bold : .none)
                        .scaleEffect(mediumEnabled ? 1.10 : 1)
                })
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color.orange)
                .clipShape(Circle())
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Button(action: hard, label: {
                    Text("Hard")
                        .fontWeight(hardEnabled ? .bold : .none)
                        .scaleEffect(hardEnabled ? 1.10 : 1)
                })
                .frame(width: 75, height: 75)
                .foregroundColor(Color.white)
                .background(Color.orange)
                .clipShape(Circle())
                .padding()
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .offset(y: -25)
            HStack {
                Button("Check") {
                    done()
                }
                .padding()
                .frame(width: 130, height: 60)
                .background(Color.secondary)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                .offset(y: -30)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Button("How To Play") {
                    colorGuesser.visibleTutorial = true
                }
                .padding()
                .frame(width: 130, height: 60)
                .background(Color.secondary)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                .offset(y: -30)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
    
    func redButton() {
        colorGuesser.addRed()
    }
    
    func greenButton() {
        colorGuesser.addGreen()
    }
    
    func blueButton() {
        colorGuesser.addBlue()
    }
    
    func done() {
        colorGuesser.check()
    }
    
    func easy(){
        easyEnabled = true
        mediumEnabled = false
        hardEnabled = false
        colorGuesser.difficulty = 1
        colorGuesser.visibleGO = true
    }
    
    func medium(){
        easyEnabled = false
        mediumEnabled = true
        hardEnabled = false
        colorGuesser.difficulty = 2
        colorGuesser.visibleGO = true
    }
    
    func hard(){
        easyEnabled = false
        mediumEnabled = false
        hardEnabled = true
        colorGuesser.difficulty = 3
        colorGuesser.visibleGO = true
    }
}

//struct ButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonView()
//    }
//}
