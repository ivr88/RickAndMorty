import Foundation

class APIService {
    
    var result: [Result] = []
    
    func fetch() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let listModel = try JSONDecoder().decode(ListModel.self, from: data)
                
                DispatchQueue.main.async {
                    self?.result = listModel.results
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}


