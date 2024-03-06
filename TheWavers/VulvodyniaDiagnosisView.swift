//
//  VulvodyniaDiagnosisView.swift
//  TheWavers
//
//  Created by Massimo Paloscia on 05/03/24.
//

import SwiftUI

struct VulvodyniaDiagnosisView: View {
    
    @State private var dateV = Date()
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack{
                    Text("When were you diagnosed with vulvodynia?")
                    
                    DatePicker(
                        "StartDate",
                        selection: $dateV,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    
                    Button(action: {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd/MM/yyyy"
                        let dateString = dateFormatter.string(from: dateV)
                        
                        UserDefaults.standard.set(dateString, forKey: "date1")
                        UserDefaults.standard.synchronize()
                    }) {
                            NavigationLink(destination: TreatmentView().onAppear(perform:{
                                saveAndModifyDate(date: dateV)
                            })) {
                                Text("CONTINUE")
                                    .fontWeight(.light)
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 50).fill(.testo).frame(width: proxy.size.width * 0.6))
                            }
                            //.padding(.leading, proxy.size.width * 0.3)
                            .padding(.top, proxy.size.width * 0.2)
                    }
                }.frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
    
    func saveAndModifyDate(date: Date){
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "dd/MM/yyyy"
        let dateString1 = dateFormatter1.string(from: date)
        print(dateString1)
        UserDefaults.standard.set(dateString1, forKey: "date1")
        UserDefaults.standard.synchronize()
    }
}

#Preview {
    VulvodyniaDiagnosisView()
}
