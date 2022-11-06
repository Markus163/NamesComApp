//
//  ResultViewController.swift
//  NamesComApp
//
//  Created by Марк Михайлов on 06.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var firstName: String!
    var secondName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"

    }
    

}
