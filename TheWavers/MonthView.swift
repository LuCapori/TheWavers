import SwiftUI

struct MonthView: View {
    @State var cards: [MonthInfo]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            VStack(alignment: .center) {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 0.5) {
                        
                        ForEach(cards, id: \.id) { card in
                            
                            ZStack {
                                Rectangle()
                                    .fill(.color)
                                    .frame(width: .infinity, height: height * 0.2)
                                VStack {
                                    let faceSize = width * 0.2
                                    
                                    Text(card.month)
                                        .font(.largeTitle)
                                        .fontWeight(.thin)
                                        .foregroundColor(.white)
                                        .frame(width: geometry.size.width, alignment: .leading)
                                        .padding(.leading, geometry.size.width * 0.03)
                                    
                                    Text("Your pain’s average is about \(String(format: "%.0f", card.avg))%")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(.white)
                                        .frame(width: geometry.size.width, alignment: .leading)
                                        .padding(.leading, width * 0.03)
                                    
                                    HStack {
                                        Face(face: card.face)
                                            .frame(width: faceSize * 0.5, height: faceSize * 0.5)
                                            .padding(.trailing, faceSize * 0.5)
                                    }.frame(width: width, alignment: .leading)
                                        .padding(.leading, width * 0.08)
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let exampleMonthInfos = [
        MonthInfo(month: "January", avg: 30),
        MonthInfo(month: "February", avg: 50),
        MonthInfo(month: "March", avg: 70)
    ]
    return MonthView(cards: exampleMonthInfos)
}
