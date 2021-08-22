import MapKit

public extension Earendil {
    struct Location: Equatable {
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

extension Earendil.Location {
    public static func == (lhs: Earendil.Location, rhs: Earendil.Location) -> Bool {
        lhs.name == rhs.name &&
            lhs.coordinateRegion.center.latitude == rhs.coordinateRegion.center.latitude &&
            lhs.coordinateRegion.center.longitude == rhs.coordinateRegion.center.longitude &&
            lhs.coordinateRegion.span.latitudeDelta == rhs.coordinateRegion.span.latitudeDelta &&
            lhs.coordinateRegion.span.longitudeDelta == rhs.coordinateRegion.span.longitudeDelta
    }
}
