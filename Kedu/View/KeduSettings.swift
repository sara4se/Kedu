//
//  KeduSettings.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//

import SwiftUI

struct KeduSettings: View {
    @State private var Music = true
    @State private var Sound = true
    @State private var isNext = false
    @State private var isAchivements = false
    @State private var isAboutUs = false
    
    var body: some View {
        ZStack{
            
            Image("Background").resizable().scaledToFill().ignoresSafeArea()
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
            VStack {
                
                
                HStack (alignment: .center, spacing: 30) {
                    Toggle("", isOn: $Music)
                        .padding(40)
                        .frame(width: 560 , height: 90)
                        .background(Color.white).mask(RoundedRectangle(cornerRadius: 60 ,style: .continuous))
                        .shadow(radius: 21 , x : 3 , y : 8)
                        .foregroundColor(Color("shady red"))
                    
                        .overlay{
                            HStack {
                                Text("🎵")
                                    .padding(.trailing, 150)
                                    .font(.system(size: 40))
                                    .padding()
                                
                                Text("Music")
                                    .font(.system(size: 40))
                                    .font(.title2.weight(.bold))
                                    .foregroundColor(Color("shady red"))
                                
                                
                                Spacer()
                            }
                        }
                    
                }
                HStack (alignment: .center, spacing: 30) {
                    
                    Toggle("", isOn: $Sound)
                        .padding(40)
                        .frame(width: 560 , height: 90)
                        .background(Color.white).mask(RoundedRectangle(cornerRadius: 60 ,style: .continuous))
                        .shadow(radius: 21 , x : 3 , y : 8)
                        .foregroundColor(Color("shady red"))
                    
                        .overlay{
                            HStack {
                                Text("🔈")
                                    .padding(.trailing, 150)
                                    .font(.system(size: 40))
                                    .padding()
                                
                                Text("Sound")
                                    .font(.system(size: 40))
                                    .font(.title2.weight(.bold))
                                    .foregroundColor(Color("yellow"))
                                
                                
                                Spacer()
                            }
                        }
                }
                
                Button(action: {
                    isAchivements.toggle()
                }, label: { Text("Achivemnts")
                        .font(.system(size: 40))
                        .font(.title2.weight(.bold))
                        .foregroundColor(Color("yg"))
                        .frame(width: 560 , height: 90)
                        .background(Color.white)
                        .mask(RoundedRectangle(cornerRadius: 60 ,style: .continuous))
                        .shadow(radius: 21 , x : 3 , y : 8)
                    
                })
                
          
                
                
                Button(action:  {
                    isAboutUs.toggle()

                }, label: { Text("About us")
                        .font(.system(size: 40))
                        .font(.title2.weight(.bold))
                        .foregroundColor(Color("green1"))
                        .frame(width: 560 , height: 90)
                        .background(Color.white)
                        .mask(RoundedRectangle(cornerRadius: 60 ,style: .continuous))
                        .shadow(radius: 21 , x : 3 , y : 8)
                })
                
                
            }
            
            if isAchivements {
                Achievements()
            }
            else if isAboutUs{
                About_us()
            }else if isNext{
                MainView()
            }
            
        }
    }
    }

struct KeduSettings_Previews: PreviewProvider {
    static var previews: some View {
        KeduSettings()
    }
}
