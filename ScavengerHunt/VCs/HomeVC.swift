//
//  HomeVC.swift
//  ScavengerHunt
//
//  Created by Thiago Hissa on 2021-03-17.
//  Copyright © 2021 thiagohissa. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    // Programmatic Points to populate TableView
    var point1 = Point.init(name: "Pacific Ave", address: "111 Pacific Avenue", task: "Eat", tags: "Eat, Toronto, Condo", rating: 3);
    var point2 = Point.init(name: "Bloor St", address: "Bloor St West", task: "Photo", tags: "Condo, Toronto, Photo", rating: 4);
    var point3 = Point.init(name: "Dundas Square", address: "1 Dundas St", task: "Shop", tags: "Shopping, Toronto, Eat", rating: 3);
    var point4 = Point.init(name: "CN Tower", address: "290 Bremner Blvd", task: "Photo", tags: "Tower, Toronto, Photo", rating: 5);
    var point5 = Point.init(name: "Pearson Airport", address: "6301 Silver Dart Dr", task: "Travel", tags: "Airport, Toronto, Planes", rating: 3);
    
    var selectedPoint: Point!;
    var points: [Point]!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PointsManager.addPoint(point: point1);
        PointsManager.addPoint(point: point2);
        PointsManager.addPoint(point: point3);
        PointsManager.addPoint(point: point4);
        PointsManager.addPoint(point: point5);
        self.points = PointsManager.points;
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.viewWillAppear(_:)), name: NSNotification.Name(rawValue: "PointEdited"), object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(self.viewWillAppear(_:)), name: NSNotification.Name(rawValue: "PointDeleted"), object: nil
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.points = PointsManager.points;
        self.tableView.reloadData();
    }
    
    // MARK: -TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.points.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PointCell = tableView.dequeueReusableCell(withIdentifier: "PointCell") as! PointCell;
        cell.pointName.text = self.points[indexPath.row].name;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedPoint = self.points[indexPath.row];
        self.performSegue(withIdentifier: "PointDetailsSegue", sender: self);
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75;
    }
    
    
    // MARK: -Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PointDetailsVC;
        destination.point = self.selectedPoint;
    }
    
}


