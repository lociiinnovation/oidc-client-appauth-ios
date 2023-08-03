//
//  AuthenticatedView.swift
//  oidc-client-appauth-ios
//
//  Created by Locii on 3/8/2023.
//

import SwiftUI

struct AuthenticatedView: View {
    @EnvironmentObject private var viewModel: AuthenticationViewModel
    let deviceWidth = UIScreen.main.bounds.size.width
    var body: some View {
        VStack {
        Text("Access Token")
                .foregroundColor(Color.gray)
                      .font(.system(size: 20))
                      .fontWeight(.semibold)            .padding(.top, 20)
            .padding(.leading, 20)
            .frame(width: deviceWidth, alignment: .leading)
        
            Text(self.viewModel.authState!.lastTokenResponse?.accessToken as! String)
                .foregroundColor(Color.blue)
                .font(.system(size: 16))
                .fontWeight(.semibold)
            .padding(.leading, 20)
            .frame(width: deviceWidth, alignment: .leading)

        Text("ID Token")
                .foregroundColor(Color.gray)
                      .font(.system(size: 20))
                      .fontWeight(.semibold)
            .padding(.top, 20)
            .padding(.leading, 20)
            .frame(width: deviceWidth, alignment: .leading)

            Text(self.viewModel.authState!.lastTokenResponse?.idToken as! String)
                .foregroundColor(Color.gray)
                      .font(.system(size: 20))
                      .fontWeight(.semibold)
            .padding(.leading, 20)
            .frame(width: deviceWidth, alignment: .leading)
        }
    }
}

struct AuthenticatedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView()
    }
}
