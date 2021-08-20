import MapKit

public extension Earendil {
    struct Location {
        internal init(_ name: String, coordinateRegion: MKCoordinateRegion) {
            self.name = name
            self.coordinateRegion = coordinateRegion
        }
        public let name: String
        public let coordinateRegion: MKCoordinateRegion
    }
}

internal extension Earendil.Location {
    init(_ name: String, _ latitude: Double, _ longitude: Double, spanDelta: Double) {
        self.init(
            name,
            coordinateRegion: MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: latitude,
                    longitude: longitude),
                span: MKCoordinateSpan(
                    latitudeDelta: spanDelta,
                    longitudeDelta: spanDelta
                )
            )
        )
    }
}
