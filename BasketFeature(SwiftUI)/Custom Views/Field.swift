//
//  AnotherField.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 08.10.2022.
//

import SwiftUI

struct Field: View {
    private var scale: CGFloat = 2
    var centerPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: 0)
    var radius = UIScreen.main.bounds.width/8
    @State var paths = [Path]()
    @State private var location: CGPoint = .zero
    @State var heightForSecond = 0.0
    var body: some View {
        //        HStack{
        //            Spacer()
        //        FirstZone()
        //                .onTapGesture {
        //                    print("zone1")
        //                }
        //
        //            TenthZone()
        //                .onTapGesture {
        //                    print("zone10")
        //                }
        //        }
        ZStack {
            ZStack{
                SecondZone
                    
                    .foregroundColor(.green)
                    .onTapGesture {
                        print("zone2")
                    }
                FirstZone
                    
                    .foregroundColor(.blue)
                    .onTapGesture {
                        print("zone1")
                    }

                ThirdZone
                    
        
                    .foregroundColor(.orange)
                    .onTapGesture {
                        print("zone3")
                    }

                FourthZone
                    
                    
                    .foregroundColor(.gray)
                    .onTapGesture {
                        print("zone4")
                    }
                FiveZone
                    
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        print("zone5")
                    }
            }
            ZStack{
            SixthZone
                
                
                .foregroundColor(.red)
                .onTapGesture {
                    print("zone6")
                }
            SeventhZone
                
                .foregroundColor(.customOrange)
                .onTapGesture {
                    print("zone7")
                }
            EightZone
                
                .foregroundColor(.customGray)
                .onTapGesture {
                    print("zone8")
                }
            NineZone
                
                .foregroundColor(.purple)
                .onTapGesture {
                    print("zone9")
                }
            TenthZone
                
                .onTapGesture {
                    print("zone10")
                }
            }
            ZStack{
                ElevenZone

                    .foregroundColor(.red)

                    .onTapGesture {
                        print("zone11")
                    }
                TwelveZone

                    .foregroundColor(.green)

                    .onTapGesture {
                        print("zone12")
                    }
                ThretennZone

                    .foregroundColor(.yellow)

                    .onTapGesture {
                        print("zone13")
                    }

            }
            FourthTeenZone

                .foregroundColor(.black)

                .onTapGesture {
                    print("zone14")
                }
                
        }
        
        
    }
    
    var FirstZone: Path{
        Path {path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: radius, y: 0))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 150), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
    
    var SecondZone: Path{
        Path {path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: radius, y: 0))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 105), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 4.141, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 105), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
    
    var ThirdZone: Path{
        Path {path in
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 75), clockwise: true)
            path.addArc(center: centerPoint, radius: radius * 4.141, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 75), clockwise: true)
            
            path.addLine(to: CGPoint(x: centerPoint.x - 1.07 * radius, y: path.currentPoint!.y))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 105), clockwise: true)
        }
    }
    
    var FourthZone: Path{
        Path {path in
            path.move(to: CGPoint(x: radius * 8, y: 0))
            path.addLine(to: CGPoint(x: radius * 7, y: 0))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 75), clockwise: false)
            path.addArc(center: centerPoint, radius: radius * 4.141, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 75), clockwise: true)
            path.addLine(to: CGPoint(x: radius * 8, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: radius * 8, y: 0))
        }
    }
    
    var FiveZone: Path{
        Path {path in
            path.move(to: CGPoint(x: radius * 8, y: 0))
            path.addLine(to: CGPoint(x: radius * 7, y: 0))
            path.addArc(center: centerPoint, radius: radius * 3, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 30), clockwise: false)
            path.addLine(to: CGPoint(x: radius * 8, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: radius * 8, y: 0))
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
            path.addLine(to: CGPoint(x: radius, y: 0))
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
        }
    }
    
    
}

struct AnotherField_Previews: PreviewProvider {
    static var previews: some View {
        Field()
    }
}
