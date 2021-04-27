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
    @IBOutlet weak var miMapa: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //dar unas cordenadadas
         miMapa.centerCoordinate = CLLocationCoordinate2D(latitude: 40.293764032, longitude: -3.745153535)
         
         //Añadir un punto de localizacion al pmapa
         
         localizacion.coordinate = CLLocationCoordinate2D(latitude: 40.293764032, longitude: -3.745153535)
         localizacion.title = "SOY YO"
         
         //Añadir localizacion al mapa
         miMapa.addAnnotation(localizacion)
         
        
         
         //crear región con parametros especificos
         region = MKCoordinateRegion(center: localizacion.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
         
         //Añadir region al mapa
         miMapa.setRegion(region, animated: true)
         
         miMapa.mapType = .satellite
     
     
     }

    
    @IBAction func btnMasAction(_ sender: Any) {
        if latitudMetros >= 5000 && longitudMetros >= 5000 {
            latitudMetros += 50
            longitudMetros += 50
        }
     
        let nuevaMas = MKCoordinateRegion(center: localizacion.coordinate, latitudinalMeters: CLLocationDistance(exactly: latitudMetros)!, longitudinalMeters: CLLocationDistance(exactly: longitudMetros)!)
               
        miMapa.setRegion(nuevaMas, animated: true)
    }
    
    @IBAction func btnMenosAction(_ sender: Any) {
        if latitudMetros >= 0 && longitudMetros >= 0 {
            latitudMetros -= 50
            longitudMetros -= 50
        }
        
        let nuevaMenos = MKCoordinateRegion(center: localizacion.coordinate, latitudinalMeters: CLLocationDistance(exactly: latitudMetros)!, longitudinalMeters: CLLocationDistance(exactly: longitudMetros)!)
     
        //Añadir region al mapa
        miMapa.setRegion(nuevaMenos, animated: true)
    }
    
    @IBAction func miSegmentoAction(_ sender: Any) {
        
        if miSegmento.selectedSegmentIndex == 0 {
            miMapa.mapType = .satellite
            print("Satelite")
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
