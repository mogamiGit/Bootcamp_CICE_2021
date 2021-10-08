//
//  Utils+Helpers.swift
//  AppTaskVersion2.0
//
//  Created by Andres Felipe Ocampo Eljaiek on 8/10/21.
//

import Foundation
import UIKit

class Utils {
    
    struct Constantes {
        let kUsuario = "USUARIO"
        let kContrasena = "CONTRASENA"
        let kUsuarioLogado = "LOGADO"
        let kPreferences = UserDefaults.standard
    }
    
    static func muestraAlerta(titulo: String, mensaje: String) -> UIAlertController {
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        return alertVC
    }
    
}
