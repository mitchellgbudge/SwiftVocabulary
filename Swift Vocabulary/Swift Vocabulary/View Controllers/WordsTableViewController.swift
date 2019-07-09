//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Mitchell Budge on 6/12/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Vocabulary Word", message: "Enter a new word with a definition for it.", preferredStyle: .alert)
        var wordEntryTextField: UITextField!
        var definitionEntryTextField: UITextField!
        alert.addTextField { (firstTextField) in
            firstTextField.placeholder = "Vocabulary word:"
            wordEntryTextField = firstTextField
        }
        alert.addTextField { (secondTextField) in
            secondTextField.placeholder = "Definition:"
            definitionEntryTextField = secondTextField
        }
        let action = UIAlertAction(title: "Enter", style: .default) { (action) in
            let wordInput = wordEntryTextField.text!
            let definitionInput = definitionEntryTextField.text!
            self.vocabController.createNewVocabularyWord(with: wordInput, and: definitionInput)
            self.tableView.reloadData()
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    // MARK: - Properties & Outlets
    
    var vocabController = VocabularyController()

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabController.vocabWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        let vocabWord = vocabController.vocabWords[indexPath.row]
        cell.textLabel?.text = vocabWord.word
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDefinition" {
            guard let vocabularyDetailVC = segue.destination as? DefinitionViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            vocabularyDetailVC.vocabWord = vocabController.vocabWords[indexPath.row]
        }
    }
}
