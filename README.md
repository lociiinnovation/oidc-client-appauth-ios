# oidc-client-examples
# Step 1: Get the AppAuth iOS demo app

First ensure that you are running an up-to-date version of Xcode, then clone the GitHub repository and open the app subfolder. You can download the demo app code via the following link:

- <https://github.com/lociiinnovation/oidc-client-appauth-ios.git>

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/25ceda0-Screen_Shot_2023-08-04_at_10.51.48_am.png",
        null,
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]

# 

The code example is a SwiftUI app and the main OAuth integration is done in the **AuthenticationViewModel** class.

# 

# Step 2: Update OAuth Client Settings

The code example uses a configuration file at **./config.json** which needs to be updated using your configuration data before running the demo app on your phone/simulator.

```
{
  "issuer": "<YOUR_ISSUER>",
  "clientID": "<YOUR_CLIENT_ID>",
  "redirectUri": "id.truuth.client:/callback",
  "scope": "<YOUR_SCOPES>" 
}
```

# 

# Step 3: Run the Sample App on an Emulator / Device

To run the app on a device you must have an Apple account configured in Xcode under **Preferences / Accounts**. You also need to sign the app, such as by selecting the **Automatically Manage Signing** option in Xcode.

Ensure that the iOS device or emulator is selected in Xcode, then run the app using Xcode’s build and run option in the top left of the IDE.:

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/3920db5-Screen_Shot_2023-08-01_at_11.08.39_am.png",
        null,
        ""
      ],
      "align": "center"
    }
  ]
}
[/block]

# 

This renders the following simple view. You can click **Start Authentication** to run an entire OpenID Connect authorization redirect:

# 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/cfd457d-MicrosoftTeams-image_4.png",
        null,
        ""
      ],
      "align": "center",
      "sizing": "380px"
    }
  ]
}
[/block]

Next an [ASWebAuthenticationSession](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession) window is shown, which first involves informing the user which app they are logging into:

# 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/421c832-MicrosoftTeams-image_5.png",
        null,
        ""
      ],
      "align": "center",
      "sizing": "380px"
    }
  ]
}
[/block]

You can then sign in to the app using Biopass universal login.

The login is done using the system browser, which overlays the mobile view and prevents the sample app from having direct access to the credentials:

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/1a0d97b-s.png",
        null,
        ""
      ],
      "align": "center",
      "sizing": "380px"
    }
  ]
}
[/block]

# 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/ca0ceaf-MicrosoftTeams-image_3.png",
        null,
        ""
      ],
      "align": "center",
      "sizing": "380px"
    }
  ]
}
[/block]

# 

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8c23481-MicrosoftTeams-image_1.png",
        null,
        ""
      ],
      "align": "center",
      "sizing": "380px"
    }
  ]
}
[/block]

# 

Once signed in the app switches to an Authenticated View, to simulate screens in real apps that work with access tokens and call APIs. This view presents details about tokens and also allows token refresh to be tested:

[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/8f1a938-MicrosoftTeams-image_6_1.jpg",
        null,
        ""
      ],
      "align": "center",
      "sizing": "380px"
    }
  ]
}
[/block]

# Reference

<https://curity.io/resources/learn/swift-ios-appauth/#get-the-code>
