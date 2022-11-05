//
//  Game2Screen.swift
//  Kedu
//
//  Created by Sara Alhumidi on 06/04/1444 AH.
//

import SwiftUI

struct Game2Screen: View {
    @State private var isShowingDetailView = false
    @State private var fullScreen = false
    @State var ShowGameScreen2 = false
    @State private var isNext = false
    var body: some View {
    
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
               
                
                HStack{
                    VStack{
                        Text("Choose").font(Font.custom("AnnieUseYourTelescope-Regular", size: 70)).foregroundColor(.gray).bold()
                        Image("charcter").resizable().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.5).shadow(radius: 10,x: 0,y:16 )
                    }.frame(width: UIScreen.main.bounds.width * 0.3 ,height: UIScreen.main.bounds.height * 0.3)
                    
                    
                    Rectangle().frame(width: UIScreen.main.bounds.width * 0.5 ,height: UIScreen.main.bounds.height * 0.6 ).cornerRadius(38).foregroundColor(.lightBlue).shadow(radius: 33)
                        .padding(.leading, 90).overlay{
                            VStack{
                                HStack{
                                    VStack{
                                        ZStack{
                                            Button(action: {
                                                ShowGameScreen2.toggle()
                                                print("button pressed")
                                            })
                                            {
                                                
                                                Rectangle().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.2).cornerRadius(38).foregroundColor(.white)
                                                    .overlay{
                                                        
                                                        Image("MyRoutine").resizable().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.width * 0.15)
                                                        
                                                    }
                                                
                                            }
                                        }
                                        Text("My Routine").font(Font.custom("AnnieUseYourTelescope-Regular", size: 36)).bold().foregroundColor(.black).padding(1)
                                        
                                        
                                        
                                    }.padding(.leading,80)
                                    
                                    VStack{
                                        ZStack{
                                            Button(action: {
                                                ShowGameScreen2.toggle()
                                                print("button pressed")
                                            })
                                            {
                                                
                                                Rectangle().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.2).cornerRadius(38).foregroundColor(.white)
                                                    .overlay{
                                                        
                                                        Image("Freetime").resizable().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.width * 0.15)
                                                        
                                                    }
                                                
                                            }
                                        }
                                        Text("Free time").font(Font.custom("AnnieUseYourTelescope-Regular", size: 36)).bold().foregroundColor(.black).padding(1)
                                        
                                        
                                        
                                    }.padding(.leading,30)
                                    
                                }
                                HStack{
                                    VStack{
                                        ZStack{
                                            Button(action: {
                                                ShowGameScreen2.toggle()
                                                print("button pressed")
                                            })
                                            {
                                                
                                                Rectangle().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.2).cornerRadius(38).foregroundColor(.white)
                                                    .overlay{
                                                        
                                                        Image("PartyTime").resizable().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.width * 0.15)
                                                        
                                                    }
                                                
                                            }
                                        }
                                        Text("Party Time").font(Font.custom("AnnieUseYourTelescope-Regular", size: 36)).bold().foregroundColor(.black).padding(1)
                                        
                                        
                                        
                                    }.padding(.leading,80)
                                    VStack{
                                        ZStack{
                                            Button(action: {
                                                ShowGameScreen2.toggle()
                                                print("button pressed")
                                            })
                                            {
                                                
                                                Rectangle().frame(width: UIScreen.main.bounds.width * 0.2 ,height: UIScreen.main.bounds.height * 0.2).cornerRadius(38).foregroundColor(.white)
                                                    .overlay{
                                                        
                                                        Image("Park").resizable().frame(width: UIScreen.main.bounds.width * 0.15 ,height: UIScreen.main.bounds.width * 0.15)
                                                        
                                                    }
                                                
                                            }
                                        }
                                        Text("Park").font(Font.custom("AnnieUseYourTelescope-Regular", size: 36)).bold().foregroundColor(.black).padding(1)
                                        
                                        
                                        
                                    }.padding(.leading,30)
                                }
                            }
                            
                        }
                }
                
                if isNext{
                    
                    ChooseActivityGame()
                    
                }
                if ShowGameScreen2{
                    Game2Screen2()
                }
            }
      
        
    }
    struct Game2Screen_Previews: PreviewProvider {
        static var previews: some View {
            Game2Screen()
        }
    }
}
