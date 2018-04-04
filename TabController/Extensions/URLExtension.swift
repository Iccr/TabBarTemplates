//
//  URLExtension.swift
//  Sipradi
//
//  Created by Dari on 6/21/17.
//  Copyright © 2017 Ekbana. All rights reserved.
//

import Foundation

extension URL {
    func queryStringComponents() -> [String: String] {
        
        var dict = [String: String]()
        
        // Check for query string
        if let query = self.query {
            
            // Loop through pairings (separated by &)
            for pair in query.components(separatedBy: "&") {
                
                // Pull key, val from from pair parts (separated by =) and set dict[key] = value
                let components = pair.components(separatedBy: "=")
                dict[components[0]] = components[1]
            }
            
        }
        
        return dict
    }
}

public func videoIDFromYouTubeURL(videoURL: URL) -> String? {
    let pathComponents = videoURL.pathComponents
    if let host = videoURL.host, pathComponents.count > 1 && host.hasSuffix("youtu.be") {
        return pathComponents[1]
    }
    return videoURL.queryStringComponents()["v"]
}
