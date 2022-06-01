//
//  ContentView.swift
//  RandomRoulette
//
//  Created by Jorge Benavides
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Roulette(divisions: 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
