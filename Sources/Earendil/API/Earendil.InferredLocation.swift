public extension Earendil {
    struct InferredLocation: Equatable {
        public let country: Earendil.Location
        public let region: Earendil.Location?
        public let subregion: Earendil.Location?
    }
}
