//
//  API.swift
//  TvingClone
//
//  Created by hyunwoo on 5/9/25.
//
import Foundation

extension Bundle {
    var APIKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "SecretKey", ofType: "plist") else {
                fatalError("Couldn't find file 'SecretKey.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'SecretKey.plist'.")
            }
            return value
        }
    }
}
