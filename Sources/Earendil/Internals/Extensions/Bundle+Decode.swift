import Foundation

internal extension Bundle {
    func decode<T: Decodable>(
        _ type: T.Type,
        from file: String,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            return []
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return []
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode([T].self, from: data)
        } catch {
            return []
        }
    }
}
