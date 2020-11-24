//
//  SwiftUIView.swift
//  Bull-s-eye
//
//  Created by пользовтель on 24.11.2020.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("🎯 Bullseye 🎯")
            Text ("Enjoy")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView().previewLayout(.fixed(width: 896, height: 414))
    }
}
