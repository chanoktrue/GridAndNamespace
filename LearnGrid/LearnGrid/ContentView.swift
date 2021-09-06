//
//  ContentView.swift
//  LearnGrid
//
//  Created by Thongchai Subsaidee on 6/9/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    let symbols = [
        "keyboard",
        "hifispeaker.fill",
        "printer.fill",
        "tv.fill",
        "desktopcomputer",
        "headphones",
        "tv.music.note",
        "mic",
        "plus.bulle",
        "video"
    ]
    
    @State private var selectedSymbol: String?
    @Namespace var namespace
    
    var body: some View {
        VStack {
            
            if selectedSymbol == nil {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    content: {
                        
                        ForEach(symbols, id: \.self) { symbol in
                            Image(systemName: symbol)
                                .font(.system(size: 40))
                                .padding()
                                .matchedGeometryEffect(id: symbol, in: namespace)
                                .onTapGesture {
                                    selectedSymbol = symbol
                                }
                        }
                        
                    })
                    .animation(.spring())
            } else if let selectedSymbol = selectedSymbol {
                Image(systemName: selectedSymbol)
                    .font(.system(size: 70))
                    .foregroundColor(.red)
                    .matchedGeometryEffect(id: selectedSymbol, in: namespace)
                    .onTapGesture {
                        withAnimation {
                            self.selectedSymbol = nil
                        }
                    }
                    .animation(.spring())
                    
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
