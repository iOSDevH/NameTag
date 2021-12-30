//
//  DetailViewComponent.swift
//  NameTag
//
//  Created by Heath Fashina on 2021-12-29.
//

import MapKit
import SwiftUI
import simd

struct DetailViewComponent: View {
    @StateObject var detailsVM = Details()
    
    @Binding var image: UIImage?
    @Binding var name: String
    @Binding var location: Location?
    
    var body: some View {
        VStack {
            Image(uiImage: (image ?? UIImage(systemName: "photo.fill"))!)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300)
            
            TextField("Name", text: $name)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.blue, lineWidth: 2)
                )
            if location != nil {
                ZStack {
                    Map(coordinateRegion: $detailsVM.mapRegion, annotationItems: [location!]) { location in
                        MapAnnotation(coordinate: location.coordinate) {
                            VStack {
                                Image(systemName: "person.2.circle.fill")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
            }
            
            Button("Get Location") {
                location = detailsVM.getUserLocation()
                detailsVM.updateMapRegion(location: location)
            }
        }
        .onAppear {
            detailsVM.updateMapRegion(location: location)
        }
        .padding()
    }
}

struct DetailViewComponent_Previews: PreviewProvider {
    static let contact = Contacts.example
    
    static var previews: some View {
        DetailViewComponent(image: .constant(contact.image), name: .constant(contact.name), location: .constant(contact.location))
    }
}
