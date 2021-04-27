//
//  VCMaps.swift
//  maps
//
//  Created by Tardes on 27/4/21.
//

import UIKit
import MapKit

class VCMaps: UIViewController {
    var latitudMetros = 100
    var longitudMetros = 100
    
    var region = MKCoordinateRegion()
    var localizacion = MKPointAnnotation ()
    
    @IBOutlet weak var miSegmento: UISegmentedControl!
    
  
    
    @IBOutlet weak var miBotonMas: UIButton!
    @IBOutlet weak var miBotonMenos: UIButton!
    
    @IBOutlet weak var miMapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //DAR COORDENADAS
              miMapa.centerCoordinate = CLLocationCoordinate2D (latitude: 40.294667716603314, longitude: -3.745422365198801)
              
              //AÑADIR UN PUNTO DE LOCALIZACION AL MAPA
              let localizacion = MKPointAnnotation()
              localizacion.coordinate = CLLocationCoordinate2D (latitude: 40.294667716603314, longitude: -3.745422365198801)
              localizacion.title = "soy YO"
              
              //AÑADIR LOCALIZACION AL MAPA
              miMapa.addAnnotation(localizacion)
              
              //CREAR REGION COMO PARAMETROS ESPECIFICOS
              let region = MKCoordinateRegion(center: localizacion.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
              
              //AÑADIR REGION AL MAPA
              miMapa.setRegion(region, animated:true)
              
              miMapa.mapType = .satellite
    }
    
    
    @IBAction func btnMasAction(_ sender: Any) {
    }
    
    @IBAction func btnMenosAction(_ sender: Any) {
        
    }
    
    @IBAction func miSegmentoAction(_ sender: Any) {
        
        if miSegmento.selectedSegmentIndex == 0 {
            miMapa.mapType = .satellite
            print("satelite")
        } else
        if miSegmento.selectedSegmentIndex == 1 {
            miMapa.mapType = .standard
            print("Standar")
        }else  {
            miMapa.mapType = .hybrid
            print("Hibrido")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
