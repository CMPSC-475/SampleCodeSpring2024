//
//  Persistence.swift
//  US States
//
//  Created by Nader Alfares on 3/11/24.
//

import Foundation

class Persistence<ModelData:Codable> {
    let filename: String
    let modelData : ModelData?
    init(filename:String) {
        self.filename = filename
        let fileurl = URL.documentsDirectory.appendingPathComponent(filename + ".json")
        if FileManager.default.fileExists(atPath: fileurl.path) {
            modelData = data(from: fileurl)
        } else {
            
            let bundle = Bundle.main
            let url = bundle.url(forResource: filename, withExtension: "json")
            guard let url = url else {modelData = nil; return}
            
            modelData = data(from: url)
        }
        
        func data(from url:URL) -> ModelData? {
            var components: ModelData?
            do {
                let contents = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                components = try decoder.decode(ModelData.self, from: contents)
            } catch {
                print(error)
                components = nil
            }
            return components
        }
    }
    
    func save(_ modelData:ModelData) {
        let encoder = JSONEncoder()
        let url = URL.documentsDirectory.appendingPathComponent(filename + ".json")
        do {
            let data = try encoder.encode(modelData)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
}
