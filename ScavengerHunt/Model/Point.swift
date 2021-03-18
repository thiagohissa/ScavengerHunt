//
//  Point.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-17.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class Point: NSObject {
    public var name: String;
    public var address: String;
    public var task: String;
    public var tags: String;
    public var rating: Double;
    
    init(name: String, address: String, task: String, tags: String, rating: Double) {
        self.name = name;
        self.address = address;
        self.task = task;
        self.tags = tags;
        self.rating = rating;
    }
}
