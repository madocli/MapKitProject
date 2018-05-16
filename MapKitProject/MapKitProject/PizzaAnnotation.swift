//
//  PizzaAnnotation.swift
//  MapKitProject
//
//  Created by Maria Donet Climent on 17/5/18.
//  Copyright © 2018 MariaDonet. All rights reserved.
//

import Foundation
import MapKit

enum AnnotationType {
    case userLocation
    case restaurant
}

class PizzaAnnotation: NSObject,MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: AnnotationType
    init(_ latitude :CLLocationDegrees,_ longitude: CLLocationDegrees, title: String, subtitle: String, type: AnnotationType){
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }
}


class PizzaAnnotations: NSObject {
    var restaurants:[PizzaAnnotation]
    
    override init(){
        //build an array of pizza loactions literally
        restaurants = [PizzaAnnotation(41.892472,-87.62687676, title: "Pizzeria Uno", subtitle:"First Deep Dish Pizza", type: .restaurant)]
        restaurants += [PizzaAnnotation(41.8931164,-87.6267778, title: "Pizzeria Due", subtitle:"Second Uno Location", type: .restaurant)]
        restaurants += [PizzaAnnotation(41.8957338,-87.6229457, title: "Gino's East", subtitle:"Deep Dish if you can't cross Michigan Avenue", type: .restaurant)]
        restaurants += [PizzaAnnotation(41.9206924,-87.6375364, title: "Chicago Pizza and Oven Grinder", subtitle:"Pizza baked in a bowl", type: .restaurant)]
        restaurants += [PizzaAnnotation(41.9217837,-87.6645778, title: "Pequods", subtitle:"Carmelized Crust Deep Dish", type: .restaurant)]
        restaurants += [PizzaAnnotation(42.0018732,-87.7258586 , title: "Lou Malnati's", subtitle:"Ex Uno's Manager goes solo", type: .restaurant)]
        restaurants += [PizzaAnnotation(41.8910953,-87.6597941 , title: "CoalFire", subtitle:"Coal fired thin pizza", type: .restaurant)]
        restaurants += [PizzaAnnotation(41.9105463,-87.6760223, title: "Piece", subtitle:"White, thin square pizza", type: .restaurant)]
        restaurants += [PizzaAnnotation(41.9633682,-87.6737948, title: "Spacca Napoli", subtitle:"Authentic Neopolitan pizza", type: .restaurant)]
    }
}
