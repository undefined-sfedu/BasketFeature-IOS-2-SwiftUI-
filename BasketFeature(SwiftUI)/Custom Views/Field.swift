//
//  AnotherField.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 08.10.2022.
//

import SwiftUI

struct Field: View {
    var scale: CGFloat = 2
    var centerPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: 0)
    var radius = UIScreen.main.bounds.width/8
    @State var paths = [Path]()
    @State var location: CGPoint = .zero
    @Binding var selectedZone: Int
    @State var colors = Array(repeating: Color.white, count: 14)
    @State var borderWidth: CGFloat = 5
    
    var body: some View {
        ZStack {
            // MARK: -
            ZStack{
                SecondZone
                    .background(
                        SecondZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 1))
                    .onTapGesture {
                        changeColorOfZone(id: 1)
                    }
                // MARK: -

                FirstZone
                    .background(
                        FirstZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                
                    .foregroundColor(getColorOfZone(id: 0))
                    .onTapGesture {
                        changeColorOfZone(id: 0)
                    }
                // MARK: -
                FourthZone
                    .background(
                        FourthZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 3))
                    .onTapGesture {
                        changeColorOfZone(id: 3)
                    }
                // MARK: -
                ThirdZone
                    .background(
                        ThirdZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 2))

                    .onTapGesture {
                        changeColorOfZone(id: 2)
                    }
                
                
                // MARK: -
                FiveZone
                    .background(
                        FiveZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 4))
                    .onTapGesture {
                        changeColorOfZone(id: 4)
                    }
                // MARK: -
            }
            ZStack{
                // MARK: -
                SixthZone
                    .background(
                        SixthZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 5))
                    .onTapGesture {
                        changeColorOfZone(id: 5)
                    }
                // MARK: -
                SeventhZone
                    .background(
                        SeventhZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 6))
                    .onTapGesture {
                        changeColorOfZone(id: 6)
                    }
                // MARK: -
                EightZone
                    .background(
                        EightZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 7))
                    .onTapGesture {
                        changeColorOfZone(id: 7)
                    }
                // MARK: -
                NineZone
                    .background(
                        NineZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 8))
                    .onTapGesture {
                        changeColorOfZone(id: 8)
                    }
                // MARK: -
                TenthZone
                    .background(
                        TenthZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 9))
                    .onTapGesture {
                        changeColorOfZone(id: 9)
                    }
                // MARK: -
            }
            ZStack{
                // MARK: -
                ElevenZone
                    .background(
                        ElevenZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 10))
                    .onTapGesture {
                        changeColorOfZone(id: 10)
                    }
                // MARK: -
                TwelveZone
                    .background(
                        TwelveZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 11))
                
                    .onTapGesture {
                        changeColorOfZone(id: 11)
                    }
                // MARK: -
                ThretennZone
                    .background(
                        ThretennZone
                            .stroke(.black, lineWidth: borderWidth)
                    )
                    .foregroundColor(getColorOfZone(id: 12))
                
                    .onTapGesture {
                        changeColorOfZone(id: 12)
                    }
                // MARK: -
                
            }
            FourthTeenZone
                .background(
                    FourthTeenZone
                        .stroke(.black, lineWidth: borderWidth)
                )
                .foregroundColor(getColorOfZone(id: 13))
                .onTapGesture {
                    changeColorOfZone(id: 13)
                }
            
        }
        
        //        ZStack{
        //            Color.pink.opacity(0.1)
        //                .edgesIgnoringSafeArea(.all)
        //
        //            FirstZone
        //            //                .background(
        //            //                    FirstZone
        //            //                        .stroke(.black)
        //            //                )
        //            //                .overlay(content: {
        //            //                    FirstZone
        //            //                        .foregroundColor(getColorOfZone(id: 0))
        //            //
        //            //                })
        //                .background(
        //                    FirstZone
        //                        .stroke(.black, lineWidth: 5)
        //                )
        //                .foregroundColor(getColorOfZone(id: 0))
        //                .onTapGesture {
        //                    changeColorOfZone(id: 0)
        //                }
        //
        //        }
    }
    
    func getColorOfZone(id: Int) -> Color {
        return colors[id]
    }
    
    func changeColorOfZone(id: Int){
        
        if selectedZone == -1 && id >= 0{
            colors[id] = .customOrange
            selectedZone = id
        }
        else if selectedZone != id && id >= 0 {
            colors[selectedZone] = .white
            selectedZone = id
            colors[selectedZone] = .customOrange
        }
        else if selectedZone == id{
            colors[selectedZone] = .white
            selectedZone = -1
        }
    }
    
    var FirstZone: Path{
        Path {path in
            path.move(to: CGPoint(x: radius * 0.05, y: 0))
            path.addLine(to: CGPoint(x: radius, y: 0))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 150), clockwise: true)
            path.addLine(to: CGPoint(x: radius * 0.1, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: radius * 0.1, y: 0))
        }
    }
    
    var SecondZone: Path{
        Path {path in
            path.move(to: CGPoint(x: radius * 0.1, y: 0))
            path.addLine(to: CGPoint(x: radius, y: 0))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 105), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 4.141, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 105), clockwise: true)
            path.addLine(to: CGPoint(x: radius * 0.1, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: radius * 0.1, y: 0))
        }
    }
    
    var ThirdZone: Path{
        Path {path in
//            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 104), endAngle: Angle(degrees: 75), clockwise: true)
//            path.addArc(center: centerPoint, radius: radius * 4.141, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 75), clockwise: true)
//
//            path.addLine(to: CGPoint(x: centerPoint.x - 1.07 * radius, y: path.currentPoint!.y))
//            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 104), endAngle: Angle(degrees: 104), clockwise: true)
            path.move(to: CGPoint(x: 3 * radius, y: UIScreen.main.bounds.width/2))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 104), endAngle: Angle(degrees: 104), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 104), endAngle: Angle(degrees: 75), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 4.141, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 75), clockwise: true)
            path.addLine(to: CGPoint(x: 2.95 * radius, y: UIScreen.main.bounds.width/2))
        }
    }
    
    var FourthZone: Path{
        Path {path in
            path.move(to: CGPoint(x: (radius * 8) - radius * 0.1, y: 0))
            path.addLine(to: CGPoint(x: radius * 7, y: 0))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 74.8), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 4.146, startAngle: Angle(degrees: 74.8), endAngle: Angle(degrees: 74.8), clockwise: true)
            path.addLine(to: CGPoint(x: (radius * 8) - radius * 0.1, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: (radius * 8) - radius * 0.1, y: 0))
        }
    }
    
    var FiveZone: Path{
        Path {path in
            path.move(to: CGPoint(x: (radius * 8) - radius * 0.05, y: 0))
            path.addLine(to: CGPoint(x: radius * 7, y: 0))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 30), clockwise: false)
            path.addLine(to: CGPoint(x: (radius * 8) - radius * 0.1, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: (radius * 8) - radius * 0.1, y: 0))
        }
    }
    
    var SixthZone: Path{
        Path {path in
            path.move(to: CGPoint(x: radius * 7, y: 0))
            path.addLine(to: CGPoint(x: radius * 6, y: 0))
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 45), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 45), endAngle: Angle(degrees: 45), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 45), endAngle: Angle(degrees: 0), clockwise: true)
        }
    }
    
    var SeventhZone: Path{
        Path {path in
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 45), endAngle: Angle(degrees: 75), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 75), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 45), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 45), endAngle: Angle(degrees: 45), clockwise: true)
        }
    }
    
    var EightZone: Path{
        Path {path in
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 105), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 105), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 75), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 75), clockwise: true)
        }
    }
    
    var NineZone: Path{
        Path {path in
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 135), endAngle: Angle(degrees: 105), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 105), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 135), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 135), endAngle: Angle(degrees: 135), clockwise: true)
        }
    }
    
    var TenthZone: Path{
        Path {path in
            path.move(to: CGPoint(x: radius, y: 0))
            path.addLine(to: CGPoint(x: radius, y: 0))
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 135), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 135), endAngle: Angle(degrees: 135), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 135), endAngle: Angle(degrees: 180), clockwise: false)
        }
    }
    
    var ElevenZone: Path{
        Path {path in
            path.move(to: CGPoint(x: radius * 2, y: 0))
            path.addLine(to: CGPoint(x: path.currentPoint!.x + radius, y: 0))
            path.addArc(center: centerPoint, radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 120), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 120), endAngle: Angle(degrees: 120), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 120), endAngle: Angle(degrees: 180), clockwise: false)
        }
    }
    
    var TwelveZone: Path{
        Path {path in
            path.addArc(center: centerPoint, radius: radius, startAngle: Angle(degrees: 120), endAngle: Angle(degrees: 60), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 60), endAngle: Angle(degrees: 60), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 60), endAngle: Angle(degrees: 120), clockwise: false)
            path.addArc(center: centerPoint, radius: radius, startAngle: Angle(degrees: 120), endAngle: Angle(degrees: 120), clockwise: true)
        }
    }
    
    var ThretennZone: Path{
        Path {path in
            path.move(to: CGPoint(x: radius * 6, y: 0))
            path.addLine(to: CGPoint(x: radius * 5, y: 0))
            path.addArc(center: centerPoint, radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 60), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 60), endAngle: Angle(degrees: 60), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 2, startAngle: Angle(degrees: 60), endAngle: Angle(degrees: 0), clockwise: true)
        }
    }
    
    var FourthTeenZone: Path{
        Path {path in
            
            path.addArc(center: centerPoint, radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: true)
            path.addLine(to: CGPoint(x: path.currentPoint!.x - radius * 2, y: 0))
        }
    }
    
    
}

//struct AnotherField_Previews: PreviewProvider {
//    static var previews: some View {
//        Field()
//    }
//}
