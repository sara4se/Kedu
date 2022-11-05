//
//  About_us.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//

import SwiftUI

struct About_us: View {
    @State private var isNext = false
    var body: some View {
        ZStack {
            
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
           
            Text("About us ")
                .foregroundColor(Color.gray)
                .font(.system(size:42 ,weight: .semibold)).offset(x:0,y:-300)
            
            Rectangle()
                .frame(width: 1117 ,height: 449)
                .foregroundColor(Color("TEFANI"))
                .mask(RoundedRectangle(cornerRadius: 60 ,style: .continuous))
            Text("We are Orion coders we care about chieldern so we develop Kedu App, to focus on personality skills for childrens. for feedback please contact us on email: orion.coders@gamil.com")
                .lineSpacing(5)
                .frame(width: 1000 ,height: 500 , alignment: .center)
                .foregroundColor(Color.white)
                .font(.system(size:42 ,weight:.thin))
            
            Image("KIDS")
                .resizable()
                .frame(width:448, height: 242).offset(x:0 ,y:350)
            
            
            Button(action: {
                
            } , label: {
                Image("Back")
                    .frame(width: 100 , height: 100).offset(x : -600 , y: -400)
                    .shadow(radius : 19 , x : 0 , y :2 )
            })
            if isNext{
                KeduSettings()
            }
        }
        
    }
}

struct About_us_Previews: PreviewProvider {
    static var previews: some View {
        About_us()
    }
}
