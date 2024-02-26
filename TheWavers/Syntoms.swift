//
//  Syntoms.swift
//  TheWavers
//
//  Created by Luca Caporicci on 19/02/24.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    @State var dimensioni : String = "All"
    
    let buttonTitles = ["Severe", "Bloating", "Cramps", "Pulse", "Ciao", "Ciao", "Ciao", "Ciao", "Ciao"] // Titoli dei pulsanti
    var selectedButtons = Set<Int>() // Set per tenere traccia dei pulsanti selezionati
    
//    override func loadView() {
//        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
//        scrollView.backgroundColor = .white
//        
//        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 600)) // Altezza arbitraria per la contentView
//        scrollView.addSubview(contentView)
    override func loadView() {
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        scrollView.backgroundColor = .white
        
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 600)) // Altezza arbitraria per la contentView
        scrollView.addSubview(contentView)
        //
        //        let buttonWidth: CGFloat = 70
        //        let buttonHeight: CGFloat = 50
        //        var yOffset: CGFloat = 20
        //        var xOffset: CGFloat = 50 //proviamo con la posizione fissa
        //
        //        for (index, title) in buttonTitles.enumerated() {
        //            let button = UIButton(type: .system)
        //
        //            if title.count > 6 {
        //                button.frame = CGRect(x: xOffset, y: yOffset, width: buttonWidth + 20, height: buttonHeight)
        //            } else {
        //                button.frame = CGRect(x: xOffset, y: yOffset, width: buttonWidth, height: buttonHeight)
        //            }
        //
        //            button.setTitle(title, for: .normal)
        //            button.tag = index // Tag per identificare il pulsante
        //            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        //            contentView.addSubview(button)
        //
        //            yOffset += buttonHeight + 10 // Spazio tra i pulsanti
        //        }
        
        //PEZZO PER LA POSIZIONE DEI PuLSANTI ( VEDI RIGA 48)************************* -->
        
        let buttonWidth: CGFloat = 100
        let buttonHeight: CGFloat = 50
        let xOffset: CGFloat = 27 // Posizione fissa del primo pulsante sull'asse x
        let yOffset: CGFloat = 20 // Posizione fissa del primo pulsante sull'asse y
        let spacing: CGFloat = 20 // Spazio tra i pulsanti
        
        // Numero di righe e colonne nella griglia
        let numberOfRows = 3
        let numberOfColumns = 3
        
        // Calcolo della larghezza e dell'altezza della griglia
        let gridWidth = CGFloat(numberOfColumns) * buttonWidth + CGFloat(numberOfColumns - 1) * spacing
        let gridHeight = CGFloat(numberOfRows) * buttonHeight + CGFloat(numberOfRows - 1) * spacing
        
        // Calcolo della posizione del primo pulsante
        let initialX = xOffset
        let initialY = yOffset
        
        for row in 0..<numberOfRows {
            for col in 0..<numberOfColumns {
                let index = row * numberOfColumns + col
                let xPosition = initialX + CGFloat(col) * (buttonWidth + spacing)
                let yPosition = initialY + CGFloat(row) * (buttonHeight + spacing)
                
                if index < buttonTitles.count {
                    let title = buttonTitles[index]
                    let button = UIButton(type: .system)
                    button.frame = CGRect(x: xPosition, y: yPosition, width: buttonWidth, height: buttonHeight)
                    button.setTitle(title, for: .normal)
                    button.tag = index // Tag per identificare il pulsante
                    button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                    button.layer.cornerRadius = 25

                    contentView.addSubview(button)
                }
            }
        }
        
//        contentView.frame.size.height = yOffset // Imposta l'altezza della contentView in base all'offset
//        scrollView.contentSize = contentView.frame.size
//        
//        self.view = scrollView
//    }
        contentView.frame.size.height = gridHeight // Imposta l'altezza della contentView in base all'altezza della griglia
           scrollView.contentSize = contentView.frame.size
           
           contentView.isUserInteractionEnabled = true // Abilita l'interazione con la contentView
           
           self.view = scrollView
       }
    // <--- FINO A QUA ( VEDI RIGA 48)*************************
    
    
    //    @objc func buttonTapped(_ sender: UIButton) {
    //        let buttonIndex = sender.tag
    //
    //        // Se il pulsante è già stato selezionato, lo deselezioniamo, altrimenti lo selezioniamo
    //        if selectedButtons.contains(buttonIndex) {
    //            selectedButtons.remove(buttonIndex)
    //            sender.backgroundColor = .clear
    //        } else {
    //            selectedButtons.insert(buttonIndex)
    //            sender.backgroundColor = .blue // Cambia il colore di sfondo per indicare che è selezionato
    //        }
    //    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        let buttonIndex = sender.tag
        
        // Se il pulsante è già stato selezionato, lo deselezioniamo, altrimenti lo selezioniamo
        if selectedButtons.contains(buttonIndex) {
            selectedButtons.remove(buttonIndex)
            sender.backgroundColor = .clear
        } else {
            selectedButtons.insert(buttonIndex)
            sender.backgroundColor = .black // Cambia il colore di sfondo per indicare che è selezionato
        }
    }
    
}
