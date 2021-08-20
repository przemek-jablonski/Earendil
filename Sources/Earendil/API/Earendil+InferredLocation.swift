public extension Earendil {
    private static var provider = InferredLocationProvider()
    static var inferredLocation: InferredLocation? {
        provider.inferredLocation
    }
}
