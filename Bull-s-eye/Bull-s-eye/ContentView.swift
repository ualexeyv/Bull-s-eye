//
//  ContentView.swift
//  Bull-s-eye
//
//  Created by пользовтель on 14.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var sliderValue: Double = 50.0
    
    var body: some View {
        VStack {
            // Text row
            Spacer()
            HStack {
                Text("Расположите слайдер как можно ближе к:")
                Text("100")
            }
            Spacer()
            // Slider row
            HStack {
                Text ("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text ("100")
            }
            Spacer()
            // Button row
            
                Button(action: {
                    print ("Button pressed")
                    self.alertIsVisible = true
                }) {
                    Text ("Hit me!!")
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    var roundedValue: Int = Int (self.sliderValue.rounded())
                    return Alert (title: Text ("Hello there"), message: Text ("Положение слайдера \(roundedValue)."), dismissButton: .default(Text ("Awesome!")))
                }
            Spacer()
                // Score row
            
            HStack {
                Button(action: {}) {
                    Text ("Start over")
                }
                Spacer()
                Text ("Score")
                Text ("999999")
                Spacer()
                Text ("Round")
                Text ("999")
                Spacer()
                Button(action: {}) {
                    Text ("Info")
                }
            }
            .padding(.bottom, 20)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
