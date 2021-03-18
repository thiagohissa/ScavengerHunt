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
    
    static func editPoint(name: String, newData: Point) -> Bool{
        let point = searchPointByName(name: name)
        if(point == nil){ return false }
        point!.name = newData.name
        point!.address = newData.address
        point!.tags = newData.tags
        point!.task = newData.task
        point!.rating = newData.rating
        return true
    }
    
    static func deletePoint(name: String) -> Void {
        for index in 0...points.count{
            let point = points[index];
            if point.name == name {
                points.remove(at: index);
                return;
            }
        }
    }
    
    static func searchPointByName(name: String) -> Point? {
        for point in points{
            if point.name == name {
                return point;
            }
        }
        return nil;
    }
    
    static func searchPointByTags(tags: String) -> Point? {
        for point in points{
            if point.tags == tags {
                return point;
            }
        }
        return nil;
    }
    
}
