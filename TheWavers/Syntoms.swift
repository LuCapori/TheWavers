//
//  Syntoms.swift
//  TheWavers
//
//  Created by Luca Caporicci on 19/02/24.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    let buttonTitles = ["Severe", "Bloating", "Cramps", "Pulse"] // Titoli dei pulsanti
    var selectedButtons = Set<Int>() // Set per tenere traccia dei pulsanti selezionati
    
    override func loadView() {
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        scrollView.backgroundColor = .white
        
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 600)) // Altezza arbitraria per la contentView
        scrollView.addSubview(contentView)
        
        let buttonWidth: CGFloat = 200
        let buttonHeight: CGFloat = 50
        var yOffset: CGFloat = 20
        
        for (index, title) in buttonTitles.enumerated() {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: (UIScreen.main.bounds.width - buttonWidth) / 2, y: yOffset, width: buttonWidth, height: buttonHeight)
            button.setTitle(title, for: .normal)
            button.tag = index // Tag per identificare il pulsante
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            contentView.addSubview(button)
            
            yOffset += buttonHeight + 10 // Spazio tra i pulsanti
        }
        
        contentView.frame.size.height = yOffset // Imposta l'altezza della contentView in base all'offset
        scrollView.contentSize = contentView.frame.size
        
        self.view = scrollView
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let buttonIndex = sender.tag
        
        // Se il pulsante è già stato selezionato, lo deselezioniamo, altrimenti lo selezioniamo
        if selectedButtons.contains(buttonIndex) {
            selectedButtons.remove(buttonIndex)
            sender.backgroundColor = .clear
        } else {
            selectedButtons.insert(buttonIndex)
            sender.backgroundColor = .blue // Cambia il colore di sfondo per indicare che è selezionato
        }
    }
}
