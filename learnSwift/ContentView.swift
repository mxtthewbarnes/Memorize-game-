//
//  ContentView.swift
//  learnSwift
//
//  Created by Matthew Barnes on 12/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFace: true)
            CardView()
            CardView()
            CardView()
        }
        
        
        .foregroundColor(.green)

        .padding()
    }
}

struct CardView: View{
    @State var isFace: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
                if isFace{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 6)
                    
                    Text("👹").font(.largeTitle)
                } else {
                    base.fill()
                }
        }
        .onTapGesture {
            isFace.toggle()
        }
            
        }
    }
    
        

#Preview {
    ContentView()
}
