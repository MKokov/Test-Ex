import Foundation
import UIKit

class DataPage: UIViewController{
    var personName: String = ""
    var age: Age = Age()

    convenience init( personName: String ) {
        self.init()
        self.personName = personName
    }

    let titleMain: UILabel = {
        let view = UILabel()
        view.text = "Personal data"
        view.font = .boldSystemFont(ofSize: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleName: UILabel = {
        let view = UILabel()
        view.text = "Download..."
        view.font.withSize(20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleAge: UILabel = {
        let view = UILabel()
        view.text = "download..."
        view.font.withSize(20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleGender: UILabel = {
        let view = UILabel()
        view.text = "download..."
        view.font.withSize(20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleNationality: UILabel = {
        let view = UILabel()
        view.text = "download..."
        view.font.withSize(20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUpConstraints()
    }

    private func setup(){
        view.backgroundColor = .white
        view.addSubview(titleMain)
        view.addSubview(titleName)
        view.addSubview(titleAge)
        view.addSubview(titleGender)
        view.addSubview(titleNationality)
        titleName.text = "Name: \(personName)"
        APIService.shared.getAge(name: personName, view: titleAge )
        APIService.shared.getGender(name: personName, view: titleGender )
        APIService.shared.getCountry(name: personName, view: titleNationality )
    }

    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            titleMain.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleName.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            titleAge.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleAge.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            titleGender.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleGender.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            titleNationality.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleNationality.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
        ])
    }
}
