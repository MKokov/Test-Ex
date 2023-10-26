import Foundation
import UIKit


class StartPage: UIViewController{

    let textField: UITextField = {
        var view = UITextField(frame: .zero)
        view.placeholder = "Enter name"
        view.borderStyle = .bezel
        view.keyboardType = .asciiCapable
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    let button: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Show Data", for: .normal)
        button.addTarget(self, action: #selector(goToDatapage), for: .touchUpInside)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUpConstraints()
    }

    private func setup(){
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(button)
        textField.delegate = self

    }

    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant:  150),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
        ])
    }

    @objc func goToDatapage(){
        guard let personName = textField.text else {return}
        let dataPage = DataPage(personName: personName)
        navigationController?.pushViewController(dataPage, animated: true)
    }

}

extension StartPage: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text!.count < 1{
            self.button.isEnabled = false
        } else {
            self.button.isEnabled = true
        }
        textField.text = textField.text?
            .trimmingCharacters(in: .punctuationCharacters)
            .trimmingCharacters(in: [" "])
    }
}
