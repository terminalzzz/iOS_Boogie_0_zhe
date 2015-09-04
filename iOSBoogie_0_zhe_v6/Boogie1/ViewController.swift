//
//  ViewController.swift
//  Boogie1
//
//  Created by Arvind Subramanian on 6/14/15.
//  Copyright (c) 2015 iOS Boogie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTxt: UITextView!
    @IBOutlet weak var resultTxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let filePath = NSBundle.mainBundle().pathForResource("small", ofType: "txt"), contents = NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding, error: nil) {
            findTheDuplicates(contents as String)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    function that counts
    how often each word appears in the text and prints:
    word1 count1
    word2 count2
    ...
    
    Print the above list in order sorted by word (swift will sort punctuation to
    come before letters -- that's fine). Store all the words as lowercase,
    so 'The' and 'the' count as the same word.
    */
    func findTheDuplicates(fileContents: String) {

        // There are a bunch of ways to do this, but here's one:
        // let's break down the problem
        
        // 1. take the giant string and turn it into individual words
        // 2. make a dictionary of [words : count]
        // 3. loop through each word in the giant string
        // 3. make each word lower case
        // 4. remove whitespace surrounding each word
        // 5. add an entry in the dictionary for each word and increment the 'count' each time you see it again in the dictionary
        // 6. once you're done get an array of all the words in the dictionary (all the keys)
        // 7. sort the words alphabetically
        // 8. loop through the array and print out the count for each word
        
        // Some useful documentation:
        // see a stackoverflow for the split method: http://stackoverflow.com/questions/25678373/swift-split-a-string-into-an-array
        
        
        // removing whitespace from a string: http://stackoverflow.com/questions/28570973/how-should-i-remove-all-the-spaces-from-a-string-swift
        
        
        // to sort an array in swift: http://stackoverflow.com/questions/25223058/how-to-sort-an-array-in-swift
        println("Raw Content: \n\(fileContents)")
        
        var wordMap = [String : Int]()
        let charSet = NSCharacterSet(charactersInString: " \n")
        
        var array = fileContents.lowercaseString.componentsSeparatedByCharactersInSet(charSet)
        var result : String = ""
        
        array = sorted(array, <)
        println(array)
        
        for word in array {
            if word != "" {
                if wordMap[word] == nil {
                    wordMap[word] = 1
                }
                else if wordMap[word] != nil {
                    wordMap[word] = wordMap[word]! + 1
                }
            }
        }
        
        var keys = sorted(wordMap.keys, <)
        for key in keys {
            result = result + "The word: \"\(key)\" and the count: \(wordMap[key]!)\n"
            
            println("The word: \"\(key)\" and the count: \(wordMap[key]!)")
        }
        
        resultTxt.text = result
        inputTxt.text = fileContents
    
    
    }
    
}

