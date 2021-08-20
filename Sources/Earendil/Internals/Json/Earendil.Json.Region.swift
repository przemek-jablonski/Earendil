internal extension Earendil.Json {
    struct Region: Decodable {
        let id: Int
        let name: String
        let lat, lon: Double
    }
}
