//
//  ViewController.swift
//  NamesComApp
//
//  Created by Марк Михайлов on 06.11.2022.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var yourNameTF: UITextField!
    
    @IBOutlet weak var partnersNameTF: UITextField!

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ResultViewController else { return }
        destinationVC.firstName = yourNameTF.text
        destinationVC.secondName = partnersNameTF.text
    }
    
    @IBAction func resultButtonTapped() {
        guard let firstName = yourNameTF.text, let secondName = partnersNameTF.text else { return }
        if firstName.isEmpty || secondName.isEmpty {
            showAlert(title: "Names are missing",
                      message: "Please enter both names 😊"
            )
            return
        }
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegue" else { return }
        yourNameTF.text = ""
        partnersNameTF.text = ""
    }
}

extension FirstViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//Скрыть клавиатуру по нажатию на экран
extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF {
            partnersNameTF.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
        return true
    }
}
