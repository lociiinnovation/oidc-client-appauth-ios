import SwiftUI

struct ErrorView: View {
    @EnvironmentObject private var viewModel: AuthenticationViewModel

    var body: some View {
        VStack() {
            Spacer()
            Image("Alert")
                  .aspectRatio(contentMode: .fit)
            Text(viewModel.error ?? "No error!")
                .font(.headline)
                .padding()
                .multilineTextAlignment(.center)
                .lineLimit(nil)
            Spacer()

            Button {
                viewModel.error = nil
                viewModel.isAuthenticated = false
            } label: {
                Text("Retry").bold()
                    .frame(maxWidth: .infinity).padding(10)
                
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("PrimaryColor"))
            .padding()

          }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
