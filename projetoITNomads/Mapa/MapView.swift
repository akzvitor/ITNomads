//
//  MapView.swift
//  projetoITNomads
//
//  Created by Student08 on 13/07/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Binding var presentSideMenu: Bool
    
    
    @StateObject var mapviewModel = ViewModel()
        
        

        @State var locAnotacoes = []
        
        
        @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253),
            span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
        
        @State private var showingSheet = false
        @State private var paisEscolhido = "Brazil"
    @State private var currentLoc = Location(name: "", regionalIndicator: "",
                                                 coordinates: CLLocationCoordinate2D(latitude: -15.749997, longitude: -47.9499962),
                                                 flag: "",
                                                 description: "")

    
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, annotationItems: mapviewModel.localizacao, annotationContent: {
                loc in
                
                //intermediarioCoordenada = CLLocationCoordinate2D(latitude: Double("2.2"), longitude: Double("2.2"))
                
                
                MapAnnotation(coordinate: loc.coordinates) {
                    Circle()
                        .fill(.black)
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            currentLoc = loc
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                            
                            DescriptionView(nomePais: currentLoc.name, picture: currentLoc.flag, descricao: currentLoc.description)
                            
                        }
                }
            })
            .ignoresSafeArea()
            VStack{
                HStack{
                    Button{
                        presentSideMenu.toggle()
                    } label: {
                        Image(systemName: "list.dash")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                
                Spacer()
                Spacer()
            }
            .padding(.horizontal, 24)
            .onAppear(){
                            mapviewModel.fetch()
                            
                            
                        }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(presentSideMenu: .constant(true))
    }
}
