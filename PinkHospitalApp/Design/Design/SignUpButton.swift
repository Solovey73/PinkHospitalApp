import SwiftUI

struct SignUpButton: View {
    let isFree: Bool
    let completion: () -> Void
    
    init(isFree: Bool, completion: @escaping () -> Void) {
        self.isFree = isFree
        self.completion = completion
    }
    
    var body: some View {
        Button(action: {
            if isFree { completion() }
        }, label: {
            Text(isFree ? "Записаться" : "Нет свободного расписания")
                .font(.h4)
        })
        .frame(maxWidth: .infinity)
        .frame(height: 47)
        .foregroundColor(isFree ? .docWhite : .docBlack)
        .background(isFree ? .docPink : .docGrey)
        .cornerRadius(8)
    }
}

#Preview {
    SignUpButton(isFree: true) {
        
    }
}
