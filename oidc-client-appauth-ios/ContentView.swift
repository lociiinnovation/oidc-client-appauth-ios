import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = AuthenticationViewModel()

    @ViewBuilder
    var body: some View {
        if viewModel.isAuthenticated {
            AuthenticatedView().environmentObject(viewModel)
        } else {
            if(viewModel.error != nil){
                ErrorView().environmentObject(viewModel)
            }
            else
            {
                UnauthenticatedView().environmentObject(viewModel)
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

