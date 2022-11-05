//
//  LogoScreen.swift
//  Kedu
//
//  Created by Sara Alhumidi on 03/04/1444 AH.
//

import SwiftUI

struct LogoScreen: View {
    @State private var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = false
    @State private var isShowing = true
    @State private var  num = 0
    @State var rotation = 0.0
    var body: some View {
        NavigationStack {
         
            ZStack{
                if self.isActive {
                    RegestrationView()
                }
                else {
                    Image("Image").resizable().scaledToFill().ignoresSafeArea(.all)
                    
                    
                    if isShowing == true{
                        
                        Image("Image1").resizable().scaledToFill()
                            .ignoresSafeArea(.all).animation(.easeInOut(duration: 5).delay(1))
                        
                        Image("Image2").resizable().scaledToFill()
                            .ignoresSafeArea(.all)  .animation(.easeInOut(duration: 5).delay(1))
                             
                        
                            .transition(AnyTransition.slide.combined(with:.offset(x : 1000,y: 1000)))
                        
                    }
                    Image("logo").resizable().frame(width: 258,height: 262 )
                        .onAppear{
                            withAnimation(.easeOut){
                                self.isShowing = true
                            }
                        }
                }
            } .navigationBarBackButtonHidden(true)
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                        withAnimation (.easeOut){
                            self.isActive = true
                        }
                    }
                }
            
        }.navigationViewStyle(.stack)
    }
    struct LogoScreen_Previews: PreviewProvider {
        static var previews: some View {
            LogoScreen()
        }
    }
}



//            }.onReceive(timer) { time in
//            guard isActive else { return }
//
//            if timeRemaining > 0 {
//                timeRemaining -= 1
//                isShowing = true
//            }
//        }.onChange(of: scenePhase) { newPhase in
//            if newPhase == .active {
//                isActive = true
//            } else {
//                isActive = false
//            }
//        }
