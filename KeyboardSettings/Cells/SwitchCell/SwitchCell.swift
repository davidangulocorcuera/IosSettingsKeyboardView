//
//  SwitchCell.swift
//  KeyboardSettings
//
//  Created by MacMini on 20/10/18.
//  Copyright © 2018 MacMini. All rights reserved.
//

import UIKit
protocol SwitchStatusTableViewCellDelegate: class{
    func switchStatusTableViewCellDidPressed(cell:
        SwitchCell, didChangevalue value: Bool)
}
class SwitchCell: UITableViewCell {
    weak var delegate:SwitchStatusTableViewCellDelegate?
    @IBOutlet weak var lbl_tittle:UILabel?
    @IBOutlet weak var sw_button:UISwitch?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func switchButtonPressed(){
        delegate?.switchStatusTableViewCellDidPressed(cell:
            self, didChangevalue: (sw_button?.isOn)! )
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
