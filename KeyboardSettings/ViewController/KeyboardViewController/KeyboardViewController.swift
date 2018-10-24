//
//  KeyboardViewController.swift
//  KeyboardSettings
//
//  Created by MacMini on 20/10/18.
//  Copyright © 2018 MacMini. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
      let swCell:SwitchCell = SwitchCell()
      let swButton:SwitchButton = SwitchButton()
    
     @IBOutlet weak var tableViewSettings: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Keyboards"
       registercells()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func registercells(){
        let identifierOptionCell = "OptionCell"
        let cellNibOption = UINib(nibName: identifierOptionCell, bundle: nil)
        tableViewSettings.register(cellNibOption, forCellReuseIdentifier: "OptionCell")
        
        let identifierSwitchCell = "SwitchCell"
        let cellNibSwitch = UINib(nibName: identifierSwitchCell, bundle: nil)
        tableViewSettings.register(cellNibSwitch, forCellReuseIdentifier: " SwitchCell")
        
        
        
        tableViewSettings.register(cellNibOption, forCellReuseIdentifier: identifierOptionCell)
        tableViewSettings.register(cellNibSwitch, forCellReuseIdentifier: identifierSwitchCell)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension KeyboardViewController:
UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        switch section{
        case 0:
            return 2
        case 1:
            return 2
        case 2:
            return 8
        case 3:
            return 1
            
        default:
            return 0
        }
       
        
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
            return 44.0
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            return 35.0
        case 2:
            return 70.0
        case 3:
            return 40.0
        default:
            return 35.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if(section == 2){
            return 45.0
        }
        else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 2:
            return "ALL KEYBOARDS"
        case 3:
            return "DICTATION"
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if(section == 2){
            return "Double tapping the space bar will insert a period followed by a space."
        }
        else{ return nil}
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: OptionCell = tableViewSettings.cellForRow(at: indexPath) as! OptionCell
        print((cell.lbl_tittle?.text)!)

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            
            let cell:OptionCell = (tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as? OptionCell)!
            
            switch indexPath.row{
            case 0:
                cell.accessoryType = .disclosureIndicator
                cell.lbl_tittle?.text = "Keyboards"
                  cell.lbl_option?.text = "3"
            case 1:
                cell.lbl_tittle?.text = "Hardware Keyboard"
           
            default:
                return cell
            }
            
            return cell
            
        case 1:
            let cell:OptionCell = (tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as? OptionCell)!
            cell.accessoryType = .disclosureIndicator
            switch indexPath.row{
            case 0:
                cell.lbl_tittle?.text = "Text Replacement"
            case 1:
                cell.lbl_tittle?.text = "One Handed Keyboard"
                cell.lbl_option?.text = "Off"
                
            default:
                return cell
            }
            return cell
            
        case 2:
            
          
            let cell:SwitchCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell)!
            cell.delegate = self
            switch indexPath.row{
            case 0:
                cell.lbl_tittle?.text = "Auto-Capitalization"
            case 1:
                cell.lbl_tittle?.text = "Auto-Correction"
            case 2:
                cell.lbl_tittle?.text = "Check Spelling"
            case 3:
                cell.lbl_tittle?.text = "Enable Caps Lock"
            case 4:
                cell.lbl_tittle?.text = "Predictive"
            case 5:
                cell.lbl_tittle?.text = "Smart Punctuation"
            case 6:
                cell.lbl_tittle?.text = "Character Preview"
            case 7:
                cell.lbl_tittle?.text = "\".\" Shortcut"
            default:
                return cell
            }
            return cell
        case 3:
            
            let cell:SwitchCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell)!
            cell.lbl_tittle?.text = "Enable Dictation"
            return cell
            
        default:
            let cell:UITableViewCell? = nil
            return cell!
        }
        
        
    }
        
        
    }
extension KeyboardViewController: SwitchStatusTableViewCellDelegate{
    func switchStatusTableViewCellDidPressed(cell: SwitchCell, didChangevalue value: Bool) {
        let indexPath = tableViewSettings.indexPath(for: cell)
        switch indexPath?.row{
        case 0:
            if(cell.sw_button?.isOn)!{ swButton.bool_autoCapitalization = true}
            else{
              swButton.bool_autoCapitalization = false
            }
            print(swButton.bool_autoCapitalization)
        case 1:
            if(cell.sw_button?.isOn)!{swButton.bool_autoCorrection = true}
            else{
               swButton.bool_autoCorrection = false
            }
            print(swButton.bool_autoCorrection)
        case 2:
            if(cell.sw_button?.isOn)!{swButton.bool_checkSpelling = true}
            else{
                swButton.bool_checkSpelling = false
            }
            print(swButton.bool_checkSpelling)
        case 3:
             if(cell.sw_button?.isOn)!{
                swButton.bool_predictive = true}
             else{
                swButton.bool_predictive = false
            }
            print(swButton.bool_predictive)
        case 4:
            if(cell.sw_button?.isOn)!{
                swButton.bool_enableCapsLock = true}
            else{
                swButton.bool_enableCapsLock = false
            }
            print(swButton.bool_enableCapsLock)
        case 5:
             if(cell.sw_button?.isOn)!{
                swButton.bool_smartPunctuation = true}
             else{
                swButton.bool_smartPunctuation = false
            }
            print(swButton.bool_smartPunctuation)
        case 6:
             if(cell.sw_button?.isOn)!{
                swButton.bool_characterPreview = true}
             else{
                swButton.bool_characterPreview = false
            }
            print(swButton.bool_characterPreview)
        case 7:
            if(cell.sw_button?.isOn)!{
                swButton.bool_shortcut = true}
            else{
                swButton.bool_shortcut = false
            }
            print(swButton.bool_shortcut)
        default:
            print ( "hola")
        }
    }
 
}

