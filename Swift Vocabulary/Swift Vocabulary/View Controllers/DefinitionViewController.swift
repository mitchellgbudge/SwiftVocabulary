//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Mitchell Budge on 6/12/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard isViewLoaded, let word = vocabWord else { return }
        definitionLabel.text = word.word
        descriptionLabel.text = word.definition
    }
    
    // MARK: - Outlets & Properties
    
    var vocabWord: VocabularyWord? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
}
