import MapKit
internal extension Earendil {
    class InferredLocationProvider {
        private lazy var regions: [Earendil.Json.Region] = {
            Bundle.module.decode([Earendil.Json.Region].self, from: Resource.regionsList)
        }()
        
        private lazy var subregions: [Earendil.Json.Region] = {
            Bundle.module.decode([Earendil.Json.Region].self, from: Resource.subregionsList)
        }()
        
        private lazy var countries: [Earendil.Json.Country] = {
            Bundle.module.decode([Earendil.Json.Country].self, from: Resource.countriesList)
        }()
        
        internal var inferredLocation: Earendil.InferredLocation? {
            guard let country = countries.first(where: { $0.alpha == NSLocale.current.countryCode }) else { return nil }
            return InferredLocation(
                country: country.asLocation(spanDelta: 60),
                region: regions.first(where: { $0.id == country.region })?.asLocation(spanDelta: 150),
                subregion: subregions.first(where: { $0.id == country.subregion })?.asLocation(spanDelta: 100)
            )
        }
    }
}

private extension Locale {
    var countryCode: String? {
        nsLocale.object(forKey: .countryCode) as? String
    }
}
