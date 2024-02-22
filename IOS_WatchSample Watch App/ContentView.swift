//
//  ContentView.swift
//  IOS_WatchSample Watch App
//
//  Created by Devin Grischow on 2/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var coinState:Bool = false //Controls the state of the coin animation
    
    @State var coinFlipValue:Bool = true //Value of the coin flip, either heads or tails
    
    @State var flippedOnce:Bool = false //If the coin has already been flipped once in the views/apps lifetime. 
    
    
    
    var body: some View {
        VStack {
            if flippedOnce{
                Text("Its \((coinFlipValue ? "Heads" : "Tails"))!").padding(.bottom, 10).fontWeight(.bold)
            }
            
            Image((coinFlipValue ? "Heads" : "Tails"))
                //.imageScale(.large)
                .resizable()
                .frame(width: 70, height: 70)
                //.clipped()
                .scaledToFill()

                .foregroundStyle(.tint)
                .rotationEffect(Angle(degrees: (coinState ? 0 : 360))) //This rotation effect normall, it rotates 360 degrees in a circle
                .rotation3DEffect(  //this is a 3D rotation effect. it rotates 360 degrees, and it flips on the Y axis
                    Angle(degrees: (coinState ? 0 : 360)),
                                          axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                ).padding(.bottom, 13)
                
            Button(action: {flipCoin()}, label: {
                Text("Flip a Coin!")
            })
            
            
            
        }
        .padding()
    }
    
    func flipCoin(){
        
        //generate a random value and set the coin to it
        
        coinFlipValue = Bool.random() //Generates a random bool state
        
        withAnimation(.spring){
            coinState.toggle()
        }
        
        flippedOnce = true
        
        
        
    
        
    }
    
    
}

#Preview {
    ContentView()
}
