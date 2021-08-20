internal extension Earendil.Json {
    struct Country: Decodable {
        let name: String
        let alpha: String
        let lat, lon: Double
        let region: Int
        let subregion: Int
    }
}
