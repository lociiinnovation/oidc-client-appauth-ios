import Foundation

struct ApplicationConfig: Decodable {

    let issuer: String
    let clientID: String
    let redirectUri: String
    let scope: String
}
