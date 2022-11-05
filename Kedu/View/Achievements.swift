//
//  Achievements.swift
//  Kedu
//
//  Created by Sara Alhumidi on 10/04/1444 AH.
//


import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.green
    var strokeWidth = 40.0
   
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
            Circle()
                .fill(Color.white)
                .frame(width:950, height: 450).offset(x:0 ,y:0)

            Image("Girl").resizable()
                .frame(width:142.15, height: 291.49).offset(x:0 ,y:0)
        }
    }
}
struct Achievements: View {
    @State private var isNextBt = false
    @State private var progress = 0.2
    @State private var isNext = false
    var body: some View {
        ZStack{
            
            Image("Background").resizable().edgesIgnoringSafeArea(.all)
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
                ProgressView(value: progress, total: 1.0)
                    .progressViewStyle(GaugeProgressStyle())
                    .frame(width: 500, height: 500)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if progress < 1.0
                        {
                            withAnimation {
                                progress += 0.5
                            }
                        }
                    }
                
                Text ("Well Done!")
                    .foregroundColor(Color.gray)
                    .font(.system(size:42 ,weight: .semibold)).offset(x:0,y:10)
                
                
                Button(action: {
                    isNextBt.toggle()
                }, label: { Text("Next")
                        .font(.system(size: 40))
                        .font(.title2.weight(.semibold))
                        .foregroundColor(.white)
                        .frame(width: 200 ,height: 90,alignment: .center)
                        . background (LinearGradient (gradient: Gradient (colors: [Color ("Yellow 1"), Color.orange]),startPoint: .bottomTrailing, endPoint: .bottomTrailing))
                        .mask(RoundedRectangle(cornerRadius: 60 ,style: .continuous))
                })
                
                
                
                
            }
            if isNextBt{
                MainView()
            }
            if isNext{
                MainView()
            }
        }
    }
}
struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
    }
}
