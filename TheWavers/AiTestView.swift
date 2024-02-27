//
//  AiTestView.swift
//  TheWavers
//
//  Created by Massimo Paloscia on 22/02/24.
//


import CoreML
import SwiftUI


struct AiTestView: View {
    @State var sentence: String = ""
    @State var emotion: String = ""
    
    
    var body: some View {
        VStack(spacing: 8) {
            TextField("Type sentence..", text: $sentence)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(.blue)
                )
                .padding()
            
            Button(
                action: {
                    self.sentimentDetector(text: sentence)
                }, label: {
                    Text("Premi")
                })
            
            Text(emotion)
        }
        .padding()
    }
    
    
    func sentimentDetector(text: String){
        guard !text.isEmpty else {
            emotion = ""
            return
        }
        
        do{
            let config = MLModelConfiguration()
            let model = try EmotionDetector(configuration: config)
            let prediction = try model.prediction(text: text)
            emotion = prediction.label
        }catch{
            print("Something went wrong")
        }
        
    }
    
}


struct AiTestView_Previews: PreviewProvider {
    static var previews: some View {
        AiTestView()
    }
}


