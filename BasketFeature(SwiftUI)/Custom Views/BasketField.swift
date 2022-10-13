//
//  BasketField.swift
//  BasketFeature(SwiftUI)
//
//  Created by Daniil on 08.10.2022.
//

import SwiftUI

extension CGFloat
{
    var degreesToRadians: Self { return self * .pi / 180}
}

struct Zone
{
    var path: Path
    var color: CGColor
    var tapped: Bool
}

struct CustomField: Shape{
    
    enum Doing
    {
        case drawField
        case paintZone
    }
    
    private var width = UIScreen.main.bounds.width
    private var height = UIScreen.main.bounds.width / 2
    private var borderWidth: CGFloat = 2
    private var zones: [Zone] = [Zone]()
    private var mode =  Doing.drawField
    private var numOfPaintedZone = 0
    private var pointOfTapped = CGPoint()
    private var radius: CGFloat = 0
//    private var centerPoint = CGPoint(x: 0, y: 0)
    private let colors = [UIColor(red: 243/255, green: 51/255, blue: 155/255, alpha: 1),
                          UIColor(red: 255/255, green: 197/255, blue: 242/255, alpha: 1),
                          UIColor(red: 255/255, green: 147/255, blue: 218/255, alpha: 1)]
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            var centerPoint = CGPoint(x: rect.width / 2, y: 0)
            var radius = rect.width / 8
            
//            // 1 zone
            path.addArc(center: centerPoint, radius: 3 * radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 150), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: radius, y: 0))
            //2 zone
            path.addArc(center: centerPoint, radius: 3 * radius, startAngle: Angle(degrees: 150), endAngle: Angle(degrees: 150), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: path.currentPoint!.y))
            path.addLine(to: CGPoint(x: 0, y: height ))
            path.addArc(center: centerPoint, radius: 4.15 * radius, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 105), clockwise: true)
            path.addArc(center: centerPoint, radius: 3 * radius, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 150), clockwise: false)
            
            // 3 zone
            
            path.addArc(center: centerPoint, radius: 3 * radius, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 105), clockwise: true)
            
            path.addArc(center: centerPoint, radius: 4.15 * radius, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 105), clockwise: true)
            path.addLine(to: CGPoint(x: 210, y: path.currentPoint!.y ))
//            path.addArc(center: centerPoint, radius: 4.15 * radius, startAngle: Angle(degrees: 105), endAngle: Angle(degrees: 75), clockwise: true)
            path.addArc(center: centerPoint, radius: 3 * radius, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 105), clockwise: true)
            path.addArc(center: centerPoint, radius: 3 * radius, startAngle: Angle(degrees: 75), endAngle: Angle(degrees: 105), clockwise: false)
            /*

            // 4 zone
            context.addArc(center: centerPoint, radius: 3 * radius, startAngle: CGFloat(75).degreesToRadians, endAngle: CGFloat(30).degreesToRadians, clockwise: true)
            context.addLine(to: CGPoint(x: bounds.width, y: context.currentPointOfPath.y))
            context.addLine(to: CGPoint(x: bounds.width ,y: bounds.height))
            context.addArc(center: centerPoint, radius: 5 * radius, startAngle: CGFloat(75).degreesToRadians, endAngle: CGFloat(75).degreesToRadians, clockwise: true)
            context.addArc(center: centerPoint, radius: 3 * radius, startAngle: CGFloat(75).degreesToRadians, endAngle: CGFloat(75).degreesToRadians, clockwise: true)
            fillCurrentPath(context: context, color: colors[2])
            // 5 zone
            context.addArc(center: centerPoint, radius: 3 * radius, startAngle: CGFloat(30).degreesToRadians, endAngle: CGFloat(30).degreesToRadians, clockwise: true)
            context.addLine(to: CGPoint(x: bounds.width, y: context.currentPointOfPath.y))
            context.addLine(to: CGPoint(x: bounds.width, y: 0))
            context.addArc(center: centerPoint, radius: 3 * radius, startAngle: CGFloat(0).degreesToRadians, endAngle: CGFloat(30).degreesToRadians, clockwise: false)
            fillCurrentPath(context: context, color: colors[0])
            
            
            // 6-13 zones
            // [([CGFloat], CGFloat, [Int])] - ([corners for every group of zones], keyForRadius, [numbers of colors of zones in array])
            let data3: [([CGFloat], CGFloat, [Int])] = [([180, 135, 105, 75, 45, 0], 2, [1,0,2,0,1]), ([180, 120, 60, 0], 1, [2,1,2])]
            for item in data3
            {
                for i in 1...item.0.count-1
                {
                    paintArcZone(context: context, startAngle: item.0[i-1], endAngle: item.0[i], keyForRadius: item.1)
                    fillCurrentPath(context: context, color: colors[item.2[i-1]])
                }
            }
            // 14 zone
            context.addArc(center: centerPoint, radius: radius, startAngle: CGFloat(180).degreesToRadians, endAngle: CGFloat(0).degreesToRadians, clockwise: true)
            fillCurrentPath(context: context, color: colors[0])
            */
        }
    }
    private mutating func fillCurrentPath(path: Path, color: UIColor)
    {
        
        if zones.count < 14 {zones.append(Zone(path: path, color: color.cgColor, tapped: false))}

//        context.setFillColor(color.cgColor)
//        context.fillPath()
//
//        context.addPath(path!)
//        context.setStrokeColor(UIColor.white.cgColor)
//        context.setLineWidth(self.borderWidth)
//        context.strokePath()

    }
    
}

struct BasketField: View {
    var body: some View {
        CustomField()
    }
}

struct BasketField_Previews: PreviewProvider {
    static var previews: some View {
        BasketField()
    }
}
