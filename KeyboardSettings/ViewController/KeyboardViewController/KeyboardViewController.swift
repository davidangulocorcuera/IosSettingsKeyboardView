//
//  KeyboardViewController.swift
//  KeyboardSettings
//
//  Created by MacMini on 20/10/18.
//  Copyright © 2018 MacMini. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {
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
      
            return 45.0
        }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 2:
            return 90.0
        case 3:
            return 90.0
        default:
            return 45.0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 2:
            return "ALL KEYBOARDS"
        case 3:
            return "Double tapping the space bar will insert a period followed by a space."
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell:OptionCell = (tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as? OptionCell)!
            cell.accessoryType = .disclosureIndicator
            return cell
            
        case 1:
            let cell:OptionCell = (tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as? OptionCell)!
            cell.accessoryType = .disclosureIndicator
            return cell
            
        case 2:
          
            let cell:SwitchCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell)!
            return cell
        case 3:
            
            let cell:SwitchCell = (tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell)!
            return cell
            
        default:
            let cell:UITableViewCell? = nil
            return cell!
        }
        
        
    }
        
        
    }
   

