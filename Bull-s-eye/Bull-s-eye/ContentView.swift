//
//  ContentView.swift
//  Bull-s-eye
//
//  Created by пользовтель on 14.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0 , blue: 102.0 / 255.0)
    
    struct ChangedValuesStyle: ViewModifier {
        func body (content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
                .modifier(Shadow())
                .font(.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    struct LableStyle: ViewModifier {
        func body (content: Content) -> some View {
            return content
                .foregroundColor(Color.white)
                .modifier(Shadow())
                .font(.custom("Optima-BoldItalic", size: 18))
        }
    }
    struct ButtonLargeStyle: ViewModifier {
        func body (content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(.custom("Optima-BoldItalic", size: 18))
        }
    }
    struct ButtonSmallStyle: ViewModifier {
        func body (content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
                .font(.custom("Optima-BoldItalic", size: 12))
        }
    }
    struct Shadow: ViewModifier {
        func body (content: Content) -> some View {
            return content
                .shadow(color: Color/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5, x: 2, y: 2)
        }
    }
    var body: some View {
        VStack {
            // Text row
            Spacer()
            HStack {
                Text("Расположите слайдер как можно ближе к:").modifier(LableStyle())
  
                Text("\(target)").modifier(ChangedValuesStyle())
                    
            }
            Spacer()
            // Slider row
            HStack {
                Text ("1").modifier(LableStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(.green)
                Text ("100").modifier(LableStyle())
            }
            Spacer()
            // Button row
            
            HStack {
                Button(action: {
                    self.alertIsVisible = true
                    
                }) {
                    Text ("Start!").modifier(ButtonLargeStyle())
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    
                    return Alert (title: Text ("\(titleMessage())"), message: Text ("Положение слайдера \(sliderValueRound()).\n Вы набрали \(calculatingPoints())"), dismissButton: .default(Text ("ОК!")){
                        self.score += self.calculatingPoints()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                    })
                }
            }
            .background(Image ("Button")).modifier(Shadow())
            Spacer()
                // Score row
            
            HStack {
                Button(action: {
                    self.reset()
                }) {
                    HStack {
                        Image ("StartOverIcon")
                        Text ("Restart").modifier(ButtonSmallStyle())
                    }
                }
                .background(Image ("Button")).modifier(Shadow())
                Spacer()
                Text ("Счет").modifier(LableStyle())
                Text ("\(score)").modifier(ChangedValuesStyle())
                Spacer()
                Text ("Попытки").modifier(LableStyle())
                Text ("\(round)").modifier(ChangedValuesStyle())
                Spacer()
                Button(action: {}) {
                    HStack {
                        Image ("InfoIcon")
                        Text ("Info").modifier(ButtonSmallStyle())
                    }
                }
                .background(Image ("Button")).modifier(Shadow())
                
            }
            .padding(.bottom, 20)
            
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
    }
    func reset () {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
    func sliderValueRound () -> Int {
        Int (sliderValue.rounded())
    }
    func calcDif () -> Int {
        abs (target - Int (sliderValueRound()))
    }
    func calculatingPoints () -> Int {
        let maxPoints = 100
        let difference = calcDif()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maxPoints - difference + bonus
    }
    func titleMessage () -> String {
        let difference = calcDif()
        let title: String
        if difference == 0 {
            title = "Прямо в яблочко!"
        } else if difference < 5 {
            title = "очень близко"
        } else if difference < 10 {
            title = "Не плохо"
        } else {
            title = "совсем не туда"
        }
        return title
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
