//
//  PointsManager.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-18.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class PointsManager: NSObject {
    static var points:[Point] = [];
    
    static func addPoint(point: Point) -> Void {
        points.append(point);
    }
    
    static func deletePoint(name: String) -> Void {
        for index in 0...points.count{
            let point = points[index];
            if point.name == name {
                points.remove(at: index);
            }
        }
    }
    
}
