//
//  DetailsViewModel.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-29.
//

import UIKit
import CoreLocation
import MapKit

@MainActor class Details: ObservableObject {
    let locationFetcher = LocationFetcher()
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 2.5, longitudeDelta: 2.5))
    
    func getUserLocation() -> Location? {
        self.locationFetcher.start()
        if let coordinate = self.locationFetcher.lastKnownLocation {
            return Location(id: UUID(), description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
        } else {
            print("Error getting location")
            return nil
        }
    }
    
    func updateMapRegion(location: Location?) {
        if let location = location {
            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 2.5, longitudeDelta: 2.5))
        } else {
            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 2.5, longitudeDelta: 2.5))
        }
        
    }
}
