//
//  Manager.swift
//  Map Explorer
//
//  Created by Nader Alfares on 2/12/24.
//

import Foundation


class Manager : ObservableObject {
    
    //MARK: - Annotation Support -
    var favorites = [Favorite(coord: Coord(latitude: 40.79550030, longitude: -77.85900170), title: "Cheese Shoppe"),
                               Favorite(coord: Coord(latitude: +40.79414797, longitude:
                                                    -77.86152899), title: "The Corner Room")]
    
}
