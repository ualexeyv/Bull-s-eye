//
//  ContentView.swift
//  Bull-s-eye
//
//  Created by пользовтель on 14.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var knockKnockIsVisible = false
    var body: some View {
        VStack {
            Text("Welcome to my first app!")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
                .padding()
            Button(action: {
                print ("Button pressed")
                self.alertIsVisible = true
            }) {
                Text ("Hit me!!")
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in return Alert (title: Text ("Hello there"), message: Text ("My first pop-up"), dismissButton: .default(Text ("Awesome!")))
            }
            Button(action: {
                print ("Second Button pressed")
                self.knockKnockIsVisible = true
            }) {
                Text ("Knock Knock!!")
            }
            .alert(isPresented: $knockKnockIsVisible) { () ->
                Alert in return Alert (title: Text ("who is there?"), message: Text ("Little old gnome"), dismissButton: .default(Text ("Little old gnome who?")))
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
