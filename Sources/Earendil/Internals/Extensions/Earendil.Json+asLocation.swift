import MapKit

internal extension Earendil.Json.Region {
    func asLocation(spanDelta: Double) -> Earendil.Location {
        Earendil.Location(name, lat, lon, spanDelta: spanDelta)
    }
}

internal extension Earendil.Json.Country {
    func asLocation(spanDelta: Double) -> Earendil.Location {
        Earendil.Location(name, lat, lon, spanDelta: spanDelta)
    }
}
