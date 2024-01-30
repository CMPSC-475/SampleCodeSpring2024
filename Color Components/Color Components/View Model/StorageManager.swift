//
//  StorageManager.swift
//  Color Components
//
//  Created by Nader Alfares on 1/30/24.
//

import Foundation


class StorageManager<T: Codable>{
    let modelData : T?
    
    init() {
        
        let fileUrl = URL.documentsDirectory.appendingPathComponent("colors.json")
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            
            do {
                let content = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                modelData = try decoder.decode(T.self, from: content)
                
                
            } catch {
                print(error)
                modelData = nil
            }
            
            return
        }

        let bundle = Bundle.main
        let url = bundle.url(forResource: "colors", withExtension: "json")
        
        guard let url = url else { modelData = nil; return}
        
        
        do {
            let content = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            modelData = try decoder.decode(T.self, from: content)
            
            
        } catch {
            print(error)
            modelData = nil
        }
        
    }
    
    
    func save(components : [ColorComponent]) {
        let encoder = JSONEncoder()
        let url = URL.documentsDirectory.appendingPathComponent("colors.json")
        do {
            let data = try encoder.encode(components)
            try data.write(to: url)
        } catch {
            print(error)
        }
        
    }
    
    
}
