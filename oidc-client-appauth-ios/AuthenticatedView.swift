import SwiftUI

struct AuthenticatedView: View {
    @EnvironmentObject private var viewModel: AuthenticationViewModel

    let deviceWidth = UIScreen.main.bounds.size.width
    var body: some View {
        Form{
            Section {
                Text("You are authenticated")
                    .font(Font.title2.weight(.bold))
                          .padding()
                          .multilineTextAlignment(.center)
                          .frame(maxWidth: .infinity, alignment: .center)

            }
            Section{
             Text("Access Token")
                .font(.headline)
             Text(self.viewModel.authState!.lastTokenResponse?.accessToken as! String)
                 .font(.body)
                 .lineLimit(nil)
                 .padding()
            }
            Section{
                Text("ID Token")
                .font(.headline)
            Text(self.viewModel.authState!.lastTokenResponse?.idToken as! String)
                .font(.body)
                .lineLimit(nil)
                .padding()

            }
            Section{
                    Button {
                        viewModel.isAuthenticated = false
                        
                    } label: {
                        Text("Retry").bold()
                            .frame(maxWidth: .infinity).padding(10)
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("PrimaryColor"))
        }
     }
    }
}

struct AuthenticatedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView()
    }
}
