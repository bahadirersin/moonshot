//
//  Bundle-Decode.swift
//  Moonshot
//
//  Created by Bahadır Ersin on 1.02.2023.
//

import Foundation

extension Bundle{
    func decode<T:Codable>(file:String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else{
            fatalError("Json file missing")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Can not read data")
        }
        
        guard let decodedContent = try? JSONDecoder().decode(T.self, from: data) else{
            fatalError("Can not parse data")
        }
        
        return decodedContent
    }
}
