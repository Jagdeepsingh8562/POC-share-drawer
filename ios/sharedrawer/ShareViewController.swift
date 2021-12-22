//
//  ShareViewController.swift
//  flutterAppMacEx
//
//  Created by Jagdeep Singh on 19/11/21.
//

import UIKit
import Social

class ShareViewController: UIViewController {
    
    var saveString: Int = 0
    let simpleLabel = UILabel()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        
        view.addSubview(simpleLabel)
        simpleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            simpleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            simpleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            simpleLabel.heightAnchor.constraint(equalToConstant: 20),
            simpleLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        simpleLabel.text = "yes\(saveString)"
        
    }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadTheString()
  }
    func loadTheString() {
        let sharedDefault = UserDefaults(suiteName: "group.com.jageepsingh.share1")!
        saveString =  sharedDefault.integer(forKey: "counter")
      simpleLabel.text = "ddsd \(saveString)"
    }
    


}
