import Foundation
import AppAuth

class AuthenticationViewModel: ObservableObject {
    @Published var authState: OIDAuthState?
    @Published var isAuthenticated = false

    private var userAgentSession: OIDExternalUserAgentSession?
    typealias PostRegistrationCallback = (_ configuration: OIDServiceConfiguration?, _ registrationResponse: OIDRegistrationResponse?) -> Void


    private func getHostingViewController() -> UIViewController {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            return scene!.keyWindow!.rootViewController!
        }
    
    func doClientRegistration(configuration: OIDServiceConfiguration, callback: @escaping PostRegistrationCallback) {

            guard let redirectURI = URL(string: "id.truuth.client:/callback") else {
                print("Error creating URL for : id.truuth.client:/callback")
                return
            }

            let request: OIDRegistrationRequest = OIDRegistrationRequest(configuration: configuration,
                                                                         redirectURIs: [redirectURI],
                                                                         responseTypes: nil,
                                                                         grantTypes: nil,
                                                                         subjectType: nil,
                                                                         tokenEndpointAuthMethod: "client_secret_post",
                                                                         additionalParameters: nil)

            // performs registration request
            print("Initiating registration request")

            OIDAuthorizationService.perform(request) { response, error in

                if let regResponse = response {
                    self.authState = OIDAuthState(registrationResponse: regResponse)
                    print("Got registration response: \(regResponse)")
                    callback(configuration, regResponse)
                } else {
                    print("Registration error: \(error?.localizedDescription ?? "DEFAULT_ERROR")")
                    self.authState = nil
                }
            }
        }
    
    func doAuthWithAutoCodeExchange(configuration: OIDServiceConfiguration, clientID: String, clientSecret: String?) {

        guard let redirectURI = URL(string: "id.truuth.client:/callback") else {
                    print("Invalid redirectURI")
                    return
                }

            // builds authentication request
            let request = OIDAuthorizationRequest(configuration: configuration,
                                                  clientId: clientID,
                                                  clientSecret: clientSecret,
                                                  scopes: [OIDScopeOpenID, OIDScopeProfile],
                                                  redirectURL: redirectURI,
                                                  responseType: OIDResponseTypeCode,
                                                  additionalParameters: nil)

            // performs authentication request
            print("Initiating authorization request with scope: \(request.scope ?? "DEFAULT_SCOPE")")

        self.userAgentSession = OIDAuthState.authState(byPresenting: request, presenting: self.getHostingViewController()) { authState, error in

                if let authState = authState {
                    self.authState = authState
                    print("Got authorization access tokens. Access token: \(authState.lastTokenResponse?.accessToken ?? "DEFAULT_TOKEN")")
                    print("Got authorization ID tokens. ID token: \(authState.lastTokenResponse?.idToken ?? "DEFAULT_TOKEN")")
                    self.isAuthenticated = true;
                } else {
                    print("Authorization error: \(error?.localizedDescription ?? "DEFAULT_ERROR")")
                    self.authState = nil
                }
            }
        }
    
    func authenticate() {
                guard let issuerURL = URL(string: "https://idp.au.test.truuth.id/acme") else {
                            print("Invalid Issuer")
                            return
                        }
        
        let clientID: String = "0JT77eDIAgsdBdnJmBa9";

      
        // discovers endpoints
                OIDAuthorizationService.discoverConfiguration(forIssuer: issuerURL) { configuration, error in

                    guard let config = configuration else {
                        print("Error retrieving discovery document: \(error?.localizedDescription ?? "DEFAULT_ERROR")")
                        self.authState = nil
                        return
                    }
                    if let clientId = clientID as! String? {
                        self.doAuthWithAutoCodeExchange(configuration: config, clientID: clientId, clientSecret: nil)
                    } else {
                        self.doClientRegistration(configuration: config) { configuration, response in

                            guard let configuration = configuration, let clientID = response?.clientID else {
                                print("Error retrieving configuration OR clientID")
                                return
                            }

                            self.doAuthWithAutoCodeExchange(configuration: configuration,
                                                            clientID: clientID,
                                                            clientSecret: response?.clientSecret)
               }
                    }}}
       }
