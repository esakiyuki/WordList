//
//  QuestionViewController.swift
//  WordList
//
//  Created by esaki yuki on 2020/05/15.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButten: UIButton!
    
    var isAnswerd: Bool = false
    var wordArray: [Dictionary<String, String>] = []
    var nowNumber: Int = 0
    let saveDate = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextButtonTapped() {
        if isAnswerd {
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < wordArray.count {
                questionLabel.text = wordArray[nowNumber]["english"]
                isAnswerd = false
                nextButten.setTitle("答えを表示", for: .normal)
            }else {
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        }else {
            answerLabel.text = wordArray[nowNumber]["japanese"]
            isAnswerd = true
            nextButten.setTitle("次へ", for: .normal)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
