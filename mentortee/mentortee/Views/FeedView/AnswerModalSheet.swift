import SwiftUI

struct AnswerModalSheet: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var keyboardHandler = KeyboardHandler()
    @State private var userAnswer = ""
    @State private var userAnswerArray: [String] = []
    @State private var checked = false

    var feedQuestion: String

    func saveAnswer() {
        userAnswerArray.append(userAnswer)
        userAnswer = ""
    }

    var body: some View {
        GroupBox {
            VStack {
                Text(feedQuestion)
                    .bold()
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                Divider()
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                // MARK: - 수정완료
                TextField(TextName.answerText, text: $userAnswer)
                    .frame(maxWidth: .infinity, maxHeight: 150, alignment: .topLeading)
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))

                HStack {
                    Button (action: { self.checked.toggle() }) {
                        HStack {
                            // MARK: - 수정완료
                            Image(systemName: checked ? IconName.checkMarkCircleFill : IconName.checkMarkCircle).foregroundColor(checked ? Color.mainGreen : Color.gray)
                            Text(TextName.privateAnswer).font(.system(size: 14)).foregroundColor(checked ? Color.black : Color.gray)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))

                Button(action: {
                    saveAnswer()
                    dismiss()
                }, label: {
                    // MARK: - 수정완료
                    Text(TextName.completeText).bold()
                            .frame(width: 310, height: 40, alignment: .center)
                    })
                    .frame(width: 310, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryColor))
                    .font(.system(size: 16))
                    .foregroundColor(Color.white)
            }
                .padding(keyboardHandler.keyboardHeight)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .groupBoxStyle(PlainGroupBoxStyle())
            .ignoresSafeArea(edges: .bottom)
            .background(Color.backgroundColor)
            .onTapGesture {
            hideKeyboard()
        }
    }
}


struct PlainGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
            .background(Color.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


struct AnswerModalView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerModalSheet(feedQuestion: "hellohellohellohellohellohellohellohellohellohellohello")
    }
}

