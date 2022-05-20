import SwiftUI

struct MythoughtModalSheet: View {
    @Environment(\.dismiss) private var dismiss
    // MARK: - 수정필요
    var answerDatetime = ["2022.04.14"]
    var myAnswer = ["건강하면서 좋아하는 일을 할 수 있는 삶이라고 생각한다."]

    var body: some View {

        ZStack {
            VStack {
                List {
                    Section(header: Text(answerDatetime[0])) {
                        Text(myAnswer[0])
                            .foregroundColor(.mainBlack)
                    }
                }
                    .background(Color.backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                Button(action: {
                    dismiss()
                }, label: {
                        Text(TextName.closeText).bold()
                            .frame(width: 310, height: 40, alignment: .center)
                    })
                    .foregroundColor(.mainBlack)
                    .frame(width: 310, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor))
                    .font(.system(size: 18))
            }
                .background(Color.backgroundColor)
        }
    }
}



struct MythoughtModalSheet_Previews: PreviewProvider {
    static var previews: some View {
        MythoughtModalSheet()
    }
}

