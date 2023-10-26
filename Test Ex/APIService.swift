import Foundation
import UIKit

class APIService{

    static var shared: APIService = {
        let instance = APIService()
        return instance
    }()

    private init(){}

    var uSession = URLSession.shared
    var jsonDecoder = JSONDecoder()

    func getGender(name: String, view: UILabel) {
        let url = URL(string:"https://api.genderize.io/?name=\(name)")!
        uSession.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            guard let gender = try? self.jsonDecoder.decode(Gender.self,from: data) else {return}
            DispatchQueue.main.async {
                guard let gender = gender.gender else {return}
                view.text = "Gender: \(gender)"
            }
        }.resume()
    }

    func getAge(name: String, view: UILabel) {
        let url = URL(string:"https://api.agify.io/?name=\(name)")!
        uSession.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            guard let age = try? self.jsonDecoder.decode(Age.self,from: data) else {return}
            DispatchQueue.main.async {
                guard let age = age.age else {return}
                view.text = "Age: \(age)"
            }
        }.resume()
    }

    func getCountry(name: String, view: UILabel) {
        let url = URL(string:"https://api.nationalize.io/?name=\(name)")!
        uSession.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            guard let country = try? self.jsonDecoder.decode(CountryContainer.self,from: data) else {return}
            DispatchQueue.main.async {
                if country.country?.isEmpty == false
                {
                    guard let country = country.country![1].country_id else {return}
                    view.text = "Country code: \(country)"
                }
            }
        }.resume()
    }
}
