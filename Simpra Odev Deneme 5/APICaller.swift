//
//  APICaller.swift
//  Simpra Odev Deneme 5
//
//  Created by Hakan Baran on 15.01.2023.
//

import Foundation


struct Constants{
    
    static let API_KEY = "4ac5802cc4e64bbc9ae9de3e0ab96232"
    static let baseURL = "https://newsapi.org"
    static let APIURL = URL(string: "\(baseURL)/v2/top-headlines?country=tr&apiKey=\(API_KEY)")
    
}

class APICaller {
    
    static let shared = APICaller()
    
    /*
     
     func getNews(comletion: @escaping((Result<[News], Error>) -> Void)) {
         
         guard let url = Constants.APIURL else {return}
         
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
             guard let data,error == nil else {return}
             do {
                 let results = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                 print(results)
                 comletion(.success(results.results))
             }catch {
                 comletion(.failure(error))
                 
             }
         }
         task.resume()
     }
     
     */
    
    
    public func getTopStories(completion: @escaping (Result<[News], Error >)-> Void){
        guard let url = Constants.APIURL else{ return }
                
               let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                   if let error = error{
                       completion(.failure(error))
                   }
                   else if let data = data{
                       do{
                           let result = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                           //print("Articles: \(String(describing: result.articles?.count))")
                           completion(.success(result.articles!))
                       }catch{
                           completion(.failure(error))
                       }
                       
                   }
               }
                task.resume()
           }
    
    /*
     URLSession.shared.dataTask(with: url) { data, response, error1 in
         if error1 != nil {
             print(error1?.localizedDescription ?? "Error!!")
             completion(nil)
         } else if let data = data {
             
             let movieList = try? JSONDecoder().decode(BestMovieResponse.self, from: data)
             
             
             if let movieList = movieList {
                 completion(movieList.results)
             }
         }
     }.resume()
     */
    
    
    
}
