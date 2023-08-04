# Step 1: Get the AppAuth iOS demo app

First ensure that you are running an up-to-date version of Xcode, then clone the GitHub repository and open the app subfolder. You can download the demo app code via the following link:

- git clone <https://github.com/lociiinnovation/oidc-client-examples>


The code example is a SwiftUI app and the main OAuth integration is done in the **AuthenticationViewModel** class.

# 

# Step 2: Update OAuth Client Settings

The code example uses a configuration file as **config.json** which needs to be updated using your configuration data before running the demo app on your phone/simulator.

```
{
  "issuer": "<YOUR_ISSUER>",
  "clientID": "<YOUR_CLIENT_ID>",
  "redirectUri": "id.truuth.client:/callback",
  "scope": "<YOUR_SCOPES>" 
}
```

# 

You can add the list of your considered scopes seperated by spaces (e.g. "openid profile"). If no scope determined, the default one would be "openid profile".

# 

# Step 3: Run the Sample App on an Emulator / Device

To run the app on a device you must have an Apple account configured in Xcode under **Preferences / Accounts**. You also need to sign the app, such as by selecting the **Automatically Manage Signing** option in Xcode.

Ensure that the iOS device or emulator is selected in Xcode, then run the app using Xcode’s build and run option in the top left of the IDE.:

# 

This renders the following simple view. You can click **Authenticate** to run an entire OpenID Connect authorization redirect:


# 

Next an [ASWebAuthenticationSession](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession) window is shown, which first involves informing the user which app they are logging into:

# 

You can then sign in to the app using Biopass universal login.

The login is done using the system browser, which overlays the mobile view and prevents the sample app from having direct access to the credentials

# 


Once signed in the app switches to an Authenticated View, to simulate screens in real apps that work with access tokens and call APIs. This view presents details about tokens and also allows token refresh to be tested.


# Reference

<https://biopass.readme.io/docs/ios-setup-and-integration-using-appauth-swiftui-app>
