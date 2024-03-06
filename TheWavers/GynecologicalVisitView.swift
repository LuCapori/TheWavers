//
//  GynecologicalVisitView.swift
//  TheWavers
//
//  Created by Massimo Paloscia on 06/03/24.
//

import SwiftUI

struct GynecologicalVisitView: View {
    
    @State private var dateG = Date()
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack{
                    Text("When was your last gynecological visit?")
                    
                    DatePicker(
                        "StartDate",
                        selection: $dateG,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    
                    Button(action: {
//                        let dateFormatter1 = DateFormatter()
//                        dateFormatter1.dateFormat = "dd/MM/yyyy"
//                        let dateString1 = dateFormatter1.string(from: dateG)
//                        print(dateString1)
//                        UserDefaults.standard.set(dateString1, forKey: "date1")
//                        UserDefaults.standard.synchronize()
                    }) {
                        NavigationLink(destination: ContentView().onAppear(perform:{
                            saveAndModifyDate(date: dateG)
                        })) {
                            Text("START")
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
        }.navigationBarBackButtonHidden(true)
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
    GynecologicalVisitView()
}


