import SwiftUI

struct FilterView: View {
    
    @Binding var currentSorted: DoctorSort
    
    var body: some View {
        HStack {
            ForEach(DoctorSort.allCases, id: \.self) { sorted in
                Button(action: {
                    withAnimation {
                        currentSorted = sorted
                    }
                }, label: {
                    HStack{
                        Spacer()
                        Text(sorted.name)
                            .font(.sub2)
                        if sorted == currentSorted {
                            Image(.vector)
                        }
                        Spacer()
                    }
                })
                .foregroundColor(sorted == currentSorted ? .docWhite : .docDarkgray)
                .padding(.vertical, 7)
                .background(sorted == currentSorted ? .docPink : .docWhite)
                .overlay {
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(.docGrey, lineWidth: 1)
                }
            }
        }
        .background(Color.docWhite)
        .cornerRadius(8)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(.docGrey, lineWidth: 1)
        }
    }
}

#Preview {
    @State var sorted: DoctorSort = .price
    return FilterView(currentSorted: $sorted)
}
