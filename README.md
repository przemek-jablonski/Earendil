# Earendil

Swift Package for fetching approximate user location without asking for their permission 👺.

Get their country, subregion or continent with one method call. This includes country names, their coordinates and even `MKCoordinateRegion` property, instantly usable with your `MapKit` views. Perfect for setting your Map's location for the first time, if you don't need GPS permission otherwise.

100% App Store safe, no-private APIs used.
</br>

## Usage

Get the location at any time:
```swift
let userLocation = Earendil.inferredLocation

userLocation.country.name // "United States of America"
userLocation.country.region.center // (37.09, -95.7)
userLocation.country.region.span // (60, 60)
```

Use the inferred location for your needs:
```swift
let userLocation = Earendil.inferredLocation

// use location data as the first-time region displayed by the map
mapView.setRegion(userLocation.country.coordinateRegion, animated: true)

// use location title (ENG only) as a content of any label in your app
navigationItem.title = userLocation.region.name

// use location for analytics purposes
FirebaseAnalytics.logEvent(UserLocationEvent(userLocation))
```

## What? How come? Why?
It's super simple - the idea is to fetch current OS system Locale (`NSLocale.current`), cast it back to Foundation's `NSLocale` and retrieve the two-character `countryCode` key. This key is mapped to internal json dataset, which contains names and coordinates for every worlds-location. That way there is no need to ask for any location permission. You can check it out right here: [InferredLocationProvider.swift](Sources/Earendil/Internals/InferredLocationProvider.swift#L22).

This approach has some consequences, mainly:
- Returned location (even for most granular level, `country`, is really very broad)
- Users travelling to another country won't update Earendil's location (which may even be desired).
- Setting location-agnostic Locale (such as `eu` instead of `eu_ES` or `en` instead of `en_US`) will prevent Earendil from getting proper location.

## Installation

Available through Swift Package Manager - open up the xcode, type this repos URL and you are good to go.
</br>

## Platform Availability

 iOS 14.0</br>
 iPadOS 14.0</br>
 macOS 11.0 Big Sur</br>
 watchOS 7.0</br>
 tvOS 14.0</br>

also compliant with  Mac Catalyst
</br>
