//
//  ChooseActivityGame.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//

import SwiftUI

struct ChooseActivityGame: View {
    @State private var isShowingDetailView = false
    @State private var ActivityButtonClicked = false
    @State private var MakeDecisionGameButtonClicked = false
    @State private var  MemoryGameButtonClicked = false
    @State private var isNext = false
    var body: some View{
 
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
               
            }.frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.1).offset(CGSize.init(width: -590, height: -390))
            VStack{
                Text("What  do you want to do today?")
                    .font(Font.custom("AnnieUseYourTelescope-Regular", size: 60)).bold().foregroundColor(.gray)
                
                HStack {
                    Button(action: {
                        ActivityButtonClicked.toggle()
                    }) {
                        Image("1toy")
                            .resizable().frame(width: UIScreen.main.bounds.width * 0.29 ,
                                               height: UIScreen.main.bounds.height * 0.27 )
                            .background(Color("GreenBg"))
                            .cornerRadius(55)
                    }
                    Button(action: {
                        MakeDecisionGameButtonClicked.toggle()
                    }) {
                        Image("2toyboy")
                            .resizable().frame(width: UIScreen.main.bounds.width * 0.29 ,
                                               height: UIScreen.main.bounds.height * 0.27)
                            .background(Color("yellowBg"))
                            .cornerRadius(55).padding(.leading,20)
                    }
                }
                Button(action: {
                    MemoryGameButtonClicked.toggle()
                }) {
                    Image("3toy")
                        .resizable().frame(width: UIScreen.main.bounds.width * 0.29,
                                           height: UIScreen.main.bounds.height * 0.27 )
                        .background(Color("BlueBg"))
                        .cornerRadius(55)
                        .padding(.top,20)
                }
            }
            if isNext {
                MainView()
            }
            if ActivityButtonClicked{
                
                Game2Screen()
                
            }
            else if MakeDecisionGameButtonClicked{
                
                MakeDecisionGame()
                
            } else if MemoryGameButtonClicked{
                
                Game1Screen(viewModel: EmojiMemoryGameViewModel(theme: DefaultThemes.theme0))
                
            }
        }
    }
}
    
    
    struct ChooseActivityGame_Previews: PreviewProvider {
        static var previews: some View {
            ChooseActivityGame()
        }
    }
    

