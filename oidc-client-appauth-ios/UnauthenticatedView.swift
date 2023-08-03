import SwiftUI

struct UnauthenticatedView: View {
    @EnvironmentObject private var viewModel: AuthenticationViewModel

    var body: some View {
        VStack {
            Text("Biopass AppAuth\nDemo App")
                  .font(Font.title.weight(.bold))
                  .foregroundColor(Color("PrimaryColor"))
                  .padding(.top , 40)
                  .multilineTextAlignment(.center)
              
            Image("AuthIcon")
                  .aspectRatio(contentMode: .fit)
                  .padding(.top, 20)
              Spacer()

            Button {
                viewModel.authenticate()
            } label: {
                Text("Authenticate").bold()
                    .frame(maxWidth: .infinity).padding(10)
                
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
