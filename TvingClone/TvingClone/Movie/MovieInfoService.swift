//
//  MovieInfoService.swift
//  TvingClone
//
//  Created by hyunwoo on 5/8/25.
//
import Foundation

final class MovieInfoService {
    
    static let shared = MovieInfoService()
    private init() {}
    
    func makeRequest(targetDt: String?) -> URLRequest?{
        //let key = Bundle.main.APIKey
        var urlString = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
        
        //urlString += "?key=\(key)"
        urlString += "?key=\(Config.key)"
        
        if let targetDt = targetDt, !targetDt.isEmpty,
           let encoded = targetDt.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            urlString += "&targetDt=\(encoded)"
        }
        guard let url = URL(string: urlString) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") //optional
        return request
    }
    func fetchMovieList(targetDt: String) async throws -> [MovieResponseModel] {
        guard let request = makeRequest(targetDt: targetDt) else{
            throw NetworkError.requestEncodingError
        }
        dump(request)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        dump(httpResponse)
        do {
            let decoded = try JSONDecoder().decode(MovieResponseWrapper.self, from: data)
            return decoded.boxOfficeResult.dailyBoxOfficeList
        } catch {
            print("디코딩실패", error)
            throw NetworkError.responseDecodingError
        }
    }
    
}
