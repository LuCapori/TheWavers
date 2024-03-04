//
//  TextInser.swift
//  TheWavers
//
//  Created by Luca Caporicci on 26/02/24.
//

import CoreML
import SwiftUI


struct TextInser: View {
    
    @State private var value: CGFloat = 0
    @State private var description: String = ""
    @State var emotion: String = ""
    @State private var isTextEntered: Bool = false

    
    var body: some View {
        VStack{
            
            if(!isTextEntered){
                Text("Describe what are your \n emotions \(Text("in this moment").foregroundColor(.testo))")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .keyboardType(.default)
                    .foregroundColor(.white)
            }
            
            TextField("Today I feel \(Text("happy").bold()) because...", text: $description)
                .font(.system(.title3))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .keyboardType(.default)
                .foregroundColor(.white)
                
            
            if(isTextEntered){
                Button(action: {
                    self.textAnalysis(text: description)
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Image(systemName: "arrow.right.circle").foregroundColor(.testo)
                        .font(.system(size: 30))
                }.padding(.top)
                
            }
                
        }.onChange(of: description) { newValue in
            isTextEntered = !newValue.isEmpty
        }
    }
    
    func textAnalysis(text: String){
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
            //Per me si dovrebbe aggiungere una view di errore da chiamare in caso di errore
        }
    }
    
}

#Preview {
    TextInser()
}
