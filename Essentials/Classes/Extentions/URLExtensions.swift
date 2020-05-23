
import UIKit

enum MimeType {
    case jpeg
    case png
    case heic
    case pdf
}

extension URL {

    public var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }
        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }

        return parameters
    }
    
    func mimeType() -> MimeType {
        if self.pathExtension.isSimilarTo("jpg") || self.pathExtension.isSimilarTo("jpeg") {
            return MimeType.jpeg
        } else if self.pathExtension.isSimilarTo("png") {
            return MimeType.png
        }  else if self.pathExtension.isSimilarTo("heic") {
            return MimeType.heic
        }
        return MimeType.pdf
    }
}
