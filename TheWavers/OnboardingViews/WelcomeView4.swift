//
//  WelcomeView4.swift
//  TheWavers
//
//  Created by Gabriele Perillo on 05/03/24.
//

import SwiftUI

struct WelcomeView4: View {
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Spacer()
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .frame(width: proxy.size.width * 0.2, height: proxy.size.height * 0.1)
                        .foregroundColor(.testo)
                        .aspectRatio(contentMode: .fit)
                    //Spacer()
                    
                    Text("This is not a medical app. To receive clinical information please consult with a specialist doctor")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    NavigationLink(destination: LoginFirstView()) {
                        Text("START")
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 50).fill(.testo).frame(width: proxy.size.width * 0.6))
                    }
                    //.padding(.leading, proxy.size.width * 0.3)
                    .padding(.top, -proxy.size.width * 0.2)

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }.navigationBarBackButtonHidden(true)
    }
}
#Preview {
    WelcomeView4()
}
