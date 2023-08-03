import SwiftUI

struct UnauthenticatedView: View {
    @EnvironmentObject private var viewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            Text("Biopass AppAuth Demo App")
                  .font(Font.title.weight(.bold))
                  .foregroundColor(Color("PrimaryColor"))
                  .padding(.top , 40)
                  .multilineTextAlignment(.center)
                  .fixedSize(horizontal: false, vertical: true)
              
            Image("AuthIcon")
                  .aspectRatio(contentMode: .fit)
                  .padding(.top, 20)
              Spacer()

            Button {
                viewModel.authenticate()
            } label: {
                Text("Authenticate").bold()
                    .frame(maxWidth: .infinity).padding(5)
                
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("PrimaryColor"))
            .padding()

              Text("Powered by")

              Image("Logo")
                  .aspectRatio(contentMode: .fit)
                  .padding(.bottom, 40)

          }
    }
}

struct UnauthenticatedView_Previews: PreviewProvider {
    static var previews: some View {
        UnauthenticatedView()
    }
}
