//
//  VocabularyController.swift
//  Swift Vocabulary
//
//  Created by Mitchell Budge on 7/8/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation

class VocabularyController {
    
    var vocabWords: [VocabularyWord]
    
    init() {
        vocabWords = [VocabularyWord(word: "Variable", definition: "A named value used to store information. Variables can be changed after being created."),
                      VocabularyWord(word: "Constant", definition: "A named value used to store information. Constants cannot be changed after being created."),
                      VocabularyWord(word: "Function", definition: "A method used to take in one or more inputs to produce one or more outputs.")]
    }
    
    func createNewVocabularyWord(with word: String, and definition: String) {
        let newWord = VocabularyWord(word: word, definition: definition)
        vocabWords.append(newWord)
    }
}
