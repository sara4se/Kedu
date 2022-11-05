//
//  MakeDecisionGame.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//

import SwiftUI

struct MakeDecisionGame: View {
    @State private var animtionAmount = 1.0
    @State private var animtionAmount2 = 1.0
    @State private var isShowingDetailView = false
    @State private var isNext = false
    
    
    var body: some View {
        
        //Navigtion
        
        ZStack{
            Image("Image").resizable().scaledToFill().ignoresSafeArea(.all)
            HStack{
                Button(action: {
                    isNext.toggle()
                }){
                    Image("back")
                        .resizable()
                        .frame(width: 90 , height: 90)
                        .rotationEffect(.degrees(0))
                    
                }
                Spacer()
                Text("Meet Your Friend").font(Font.custom("AnnieUseYourTelescope-Regular", size: 60)).bold().foregroundColor(.gray)
                
            }.frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.2).offset(CGSize.init(width: -240, height: -380))
            
            VStack{
                Image("meet").renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width * 0.33 ,height: UIScreen.main.bounds.height * 0.32 )
                .cornerRadius(55)
                HStack(alignment: .bottom, spacing: 50){
                    
                    Button(action: {}) {
                        Image("fight")
                            .resizable().frame(width: UIScreen.main.bounds.width * 0.35 ,height: UIScreen.main.bounds.height * 0.30 )
                            .cornerRadius(55)
                            .overlay(
                                RoundedRectangle(cornerRadius: 55)
                                    .stroke(.red,lineWidth: 4)
                                    .scaleEffect(animtionAmount2)
                                    .opacity(2-animtionAmount2)
                                    .animation(
                                        .easeOut(duration: 1),
                                        value: animtionAmount2)
                            ).onTapGesture {
                                
                                animtionAmount2 = 2
                                
                            }
                        
                        
                        
                    }
                    Button(action: {}) {
                        Image("play")
                        
                            .resizable().frame(width: UIScreen.main.bounds.width * 0.35 ,
                                               height: UIScreen.main.bounds.height * 0.30)
                            .cornerRadius(55)
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 55)
                                    .stroke(.green, lineWidth: 4)
                                    .scaleEffect(animtionAmount)
                                    .opacity(2-animtionAmount)
                                    .animation(
                                        .easeOut(duration: 1),
                                        value: animtionAmount)
                            ).onTapGesture {
                                
                                animtionAmount = 2
                                
                            }
                    }
                    
                }
                
                .padding(.all)
                
                ///
            }.padding(.top,100)
            if isNext{
                ChooseActivityGame()
            }
        }
    }
}


struct MakeDecisionGame_Previews: PreviewProvider {
    static var previews: some View {
        MakeDecisionGame()
    }
}

