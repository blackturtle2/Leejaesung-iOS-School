//
//  DetailViewController.swift
//  FriendList
//
//  Created by youngmin joo on 2017. 6. 26..
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var segmentedControlGender: UISegmentedControl!
    @IBOutlet weak var navigationItemTitle: UINavigationItem!
    
    var vPerson:Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vPerson?.gender = .Man

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonItemComplete(_ sender: UIBarButtonItem) {
        // ***** 예외 처리 시작 ***** //
        // Textfield - 비어있는지 체크.
        if (textFieldName.text?.isEmpty)! || (textFieldAge.text?.isEmpty)! {
            JS_ToolBox.showOkAlert(sender: self, title: "알림", massage: "정보가 부족합니다.", handler: nil)
            return
        }
        
        vPerson?.name = textFieldName.text!
        vPerson?.age = Int(textFieldAge.text!)!
        
        // UserDefaults 데이터 - nil 여부 체크.
        guard let vArrayTotalFriends = UserDefaults.standard.array(forKey: "friends") else {
            UserDefaults.standard.set([["Name": textFieldName.text!, "Age": textFieldAge.text!, "Gender": Gender.Man]], forKey: "friends")
            return
        }
        // ***** 예외 처리 끝***** //
        
        var arrayTotalFriends = vArrayTotalFriends
        let dicNewFriend:[String:Any] = ["Name": textFieldName.text!, "Age": textFieldAge.text!, "Gender": Gender.Man]
        
        arrayTotalFriends.append(dicNewFriend)
        
        UserDefaults.standard.set(arrayTotalFriends, forKey: "friends")
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func segmentedControlGenderValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            vPerson?.gender = .Man
        case 1:
            vPerson?.gender = .Woman
        case 2:
            vPerson?.gender = .Unknown
        default :
            return
        }
    }

    
    @IBAction func buttonDeleteAction(_ sender: UIButton) {
        
    }

}