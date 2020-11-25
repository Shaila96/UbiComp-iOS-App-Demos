//
//  NLPViewController.swift
//  Demo-Week12
//
//  Created by Shaila Zaman on 11/11/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit
import NaturalLanguage

class NLPViewController: UIViewController {
    @IBOutlet weak var textToProcess: UILabel!
    @IBOutlet weak var nlpOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // textToProcess.text = "Start Developing iOS Apps (Swift) is the perfect starting point for learning to create apps that run on iPhone and iPad. View this set of incremental lessons as a guided introduction to building your first app—including the tools, major concepts, and best practices that will ease your path."
        // checkLanguage()
        
        
        // textToProcess.text = "Hello. How are you? Where do you live now"
        // tokenizeText()
        
        
        // textToProcess.text = "Start Started Starting"
        // lemmatizeText()
        
        
        // textToProcess.text = "Each lesson contains a tutorial and the conceptual information you need to complete it. The lessons build on each other, walking you through a step-by-step process of creating a simple, real-world iOS app."
        // checkPos()
        
        
        // textToProcess.text = "Apple becomes first US company to reach a $2 trillion market cap."
        // textToProcess.text = "Tom and Harry met at Dublin airport in Ireland"
        // checkNer()
        
        
        // textToProcess.text = "He loves mountain hiking"
        // textToProcess.text = "He hates mountain hiking"
        // analyzeSentiment()
    }
    
    func checkLanguage() {
        let langRecognizer = NLLanguageRecognizer()
        langRecognizer.processString(textToProcess.text!)
        
        guard let languageCode = langRecognizer.dominantLanguage?.rawValue else { return }
        let identifiedLanguage = Locale.current.localizedString(forIdentifier: languageCode)
        
        nlpOutput.text = "Identified language is: \(String(describing: identifiedLanguage!))"
    }
    
    func tokenizeText(){
        let text = textToProcess.text!
        let tokenizer = NLTokenizer(unit: .sentence)
        tokenizer.string = text
        
        var outputTxt = ""
        tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            // print(text[tokenRange])
            outputTxt = outputTxt + text[tokenRange] + "\n"
            return true
        }
        
        nlpOutput.text = String(outputTxt.dropLast(2))
    }
    
    func lemmatizeText(){
        let text = textToProcess.text!
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = text
        
        var outputTxt = ""
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lemma) { tag, tokenRange in
            if let tag = tag {
                // print("\(text[tokenRange]): \(tag.rawValue.capitalized)")
                outputTxt = outputTxt + "\(text[tokenRange]): \(tag.rawValue.capitalized) \n"
            }
            return true
        }
        
        nlpOutput.text = outputTxt
    }
    
    func checkPos() {
        let text = textToProcess.text!
        
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        let options : NLTagger.Options = [.omitWhitespace, .omitPunctuation]
        tagger.string = text
        
        var outputTxt = ""
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
            if let tag = tag{
                outputTxt = outputTxt + "\(text[tokenRange]): \(tag.rawValue) \n"
                // print("\(text[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
        
        nlpOutput.text = outputTxt
    }
    
    
    
    func checkNer() {
        let text = textToProcess.text!
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.string = text

        let options : NLTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
        let tags: [NLTag] = [.personalName, .placeName, .organizationName]
        
        var outputTxt = ""
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .nameType, options: options) { tag, tokenRange in
            if let tag = tag, tags.contains(tag) {
                outputTxt = outputTxt + "\(text[tokenRange]): \(tag.rawValue) \n"
                // print("\(text[tokenRange]): \(tag.rawValue)")
            }
            return true
        }
        
        nlpOutput.text = outputTxt
    }
    
    func analyzeSentiment() {
        let text = textToProcess.text!
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text

        let sentiment = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore).0
        let score = Double(sentiment?.rawValue ?? "0") ?? 0
        
        nlpOutput.text = "Sentiment Score: \(score) "
    }

}
