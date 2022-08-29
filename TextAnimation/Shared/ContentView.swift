//
//  ContentView.swift
//  Shared
//
//  Created by Bryan Danquah🖤 on 20/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var startAnimation: Bool = false
    @State var circleAnimation1: Bool = false
    @State var circleAnimation2: Bool = false
    @State var endAnimation: Bool = false
    @State var showName: Bool = false
    var body: some View {
        ZStack{
//            Color(.blue)
            LinearGradient(colors: [.black], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            ZStack{
               
                Group{
                    
                    //Custom Shape With Animation
                    
                    //Shadow Hover
                    Shadow1()
                        .trim(from: 0, to: startAnimation ? 1 : 0)
                    // Stroke To Get Outline
                        .stroke(Color("Pink"), style: StrokeStyle(lineWidth: 30, lineCap: .butt, lineJoin: .round))
                        .offset(x: 40, y: 0)
                    
                    Shadow1Stem()
                        .trim(from: 0, to: startAnimation ? 1 : 0)
                    // Stroke To Get Outline
                        .stroke(Color("Pink"), style: StrokeStyle(lineWidth: 30, lineCap: .butt, lineJoin: .round))
                        .offset(x: 40, y: 0)
                    
                    Shadow2()
                        .trim(from: 0, to: startAnimation ? 1 : 0)
                    // Stroke To Get Outline
                        .stroke(Color("Blue"), style: StrokeStyle(lineWidth: 30, lineCap: .butt, lineJoin: .round))
                        .offset(x: 20, y: -10)
                    
                    Shadow2Stem()
                        .trim(from: 0, to: startAnimation ? 1 : 0)
                    // Stroke To Get Outline
                        .stroke(Color("Blue"), style: StrokeStyle(lineWidth: 30, lineCap: .butt, lineJoin: .round))
                        .offset(x: 20, y: -10)
                    
                    SplashShape()
                        .trim(from: 0, to: startAnimation ? 1 : 0)
                    // Stroke To Get Outline
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 30, lineCap: .butt, lineJoin: .round))
                        .offset(x: 25, y: 0)
                    
                    SplashShape2()
                        .trim(from: 0, to: startAnimation ? 1 : 0)
                    // Stroke To Get Outline
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 30, lineCap: .square, lineJoin: .round))
                        .offset(x: 25, y: 0)
                    

                    //Two Circles
                    VStack{
                        Circle()
                            .fill(.white)
                            .frame(width: 35, height: 35)
                            .scaleEffect(circleAnimation1 ? 1: 0)
                            .offset(x: -50, y: -22)

                        Circle()
                            .fill(.white)
                            .frame(width: 35, height: 35)
                            .scaleEffect(circleAnimation2 ? 1: 0)
                            .offset(x: 50, y: -22)
                    }
//
                    Name()
                        .frame(width: 400, height: 200)
                        .scaleEffect(showName ? 1: 0)
                        .offset(x: 0, y: 170)
//
//                    DelayTime()
//                        .frame(width: 400, height: 200)
//                        .scaleEffect(delay ? 1: 0)
//                        .offset(x: 0, y: 0)
                }
                //Default Frame
                .frame(width: 220, height: 130)
                .scaleEffect(endAnimation ? 0.7 : 0.9)
                .rotationEffect(.init(degrees: endAnimation ? 360 : 0))
//                .frame(maxHeight: .infinity, alignment: .center)
                .padding(.bottom, 120)
                
            }
            VStack{
                Text("Powered by")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Text("Bryan")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .foregroundColor(.white.opacity(0.8))
            .padding(.bottom)
            .opacity(startAnimation ? 1 : 0)
            .opacity(endAnimation ? 0 : 1)
        }
        //Changing View
//        .offset(x: delay ? -(getRect().width * 1) : 0)
        .ignoresSafeArea()
        .onAppear{
            //Delay Start
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){


//                //Final Circle
                
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 1.05).delay(0.3)){
                    startAnimation.toggle()
                }

                

                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 0.3).delay(1.2)){
                    endAnimation.toggle()
                }
                
                withAnimation(.spring().delay(2.3)){
                    showName.toggle()
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SplashShape : Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
        let mid = rect.width / 2
        let height = rect.height
        
        // 80 = 40 Arc Radius
            path.move(to: CGPoint(x: mid - 80, y: height))
            
            path.addArc(center: CGPoint(x: mid - 40, y: height),
                        radius: 40, startAngle: .init(degrees: 180),
                        endAngle: .init(degrees: 1000), clockwise: false)
            
            
        //Straight Line
            path.move(to: CGPoint(x: mid, y: height))
            path.addLine(to: CGPoint(x: mid, y: 0))
            

        }
    }
}

struct SplashShape2 : Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
        let mid = rect.width / 2
        let height = rect.height
            
        //Second Arc
            path.addArc(center: CGPoint(x: mid + 40, y: height/100),
                        radius: 40, startAngle: .init(degrees: 180),
                        endAngle: .init(degrees: 90), clockwise: true)
        }
    }
}

struct Name: View{
    var body: some View{
        Text("TikTok")
            .font(.system(size: 50, weight: .bold))
            .kerning(5)
            .foregroundColor(.white)
    }
}


//Shadow
struct Shadow1 : Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
        let mid = rect.width / 2
        let height = rect.height
        
        // 80 = 40 Arc Radius
            path.move(to: CGPoint(x: mid - 80, y: height))
            
            path.addArc(center: CGPoint(x: mid - 40, y: height),
                        radius: 40, startAngle: .init(degrees: 180),
                        endAngle: .init(degrees: 1000), clockwise: false)
            
            
        //Straight Line
            path.move(to: CGPoint(x: mid, y: height))
            path.addLine(to: CGPoint(x: mid, y: 0))
            

        }
    }
}

struct Shadow1Stem : Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
        let mid = rect.width / 2
        let height = rect.height
            
        //Second Arc
            path.addArc(center: CGPoint(x: mid + 40, y: height/100),
                        radius: 40, startAngle: .init(degrees: 180),
                        endAngle: .init(degrees: 90), clockwise: true)
        }
    }
}

//Shadwo 2 blue
struct Shadow2 : Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
        let mid = rect.width / 2
        let height = rect.height
        
        // 80 = 40 Arc Radius
            path.move(to: CGPoint(x: mid - 80, y: height))
            
            path.addArc(center: CGPoint(x: mid - 40, y: height),
                        radius: 40, startAngle: .init(degrees: 180),
                        endAngle: .init(degrees: 1000), clockwise: false)
            
            
        //Straight Line
            path.move(to: CGPoint(x: mid, y: height))
            path.addLine(to: CGPoint(x: mid, y: 0))
            

        }
    }
}

struct Shadow2Stem : Shape{
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            
        let mid = rect.width / 2
        let height = rect.height
            
        //Second Arc
            path.addArc(center: CGPoint(x: mid + 40, y: height/100),
                        radius: 40, startAngle: .init(degrees: 180),
                        endAngle: .init(degrees: 90), clockwise: true)
        }
    }
}

