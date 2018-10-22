//
//  SettingButton.swift
//  KeyboardSettings
//
//  Created by MacMini on 20/10/18.
//  Copyright © 2018 MacMini. All rights reserved.
//

import Foundation
class SwitchButton{
    var bool_autoCapitalization: Bool!
    var bool_autoCorrection: Bool!
    var bool_checkSpelling: Bool!
    var bool_enableCapsLock: Bool!
    var bool_predictive: Bool!
    var bool_smartPunctuation: Bool!
    var bool_characterPreview: Bool!
    var bool_shortcut: Bool!
    var bool_enableDictation: Bool!
   
    
    init(){}
    
    init(bool_autoCapitalization: Bool,bool_autoCorrection: Bool,bool_checkSpelling: Bool,bool_enableCapsLock: Bool,bool_predictive: Bool,bool_smartPunctuation: Bool,bool_characterPreview: Bool,
         bool_shortcut: Bool,bool_enableDictation: Bool){
        self.bool_autoCapitalization = bool_autoCapitalization
        self.bool_autoCorrection = bool_autoCorrection
        self.bool_checkSpelling = bool_checkSpelling
        self.bool_enableCapsLock = bool_enableCapsLock
        self.bool_predictive = bool_predictive
        self.bool_smartPunctuation = bool_smartPunctuation
        self.bool_characterPreview = bool_characterPreview
        self.bool_shortcut = bool_shortcut
        self.bool_enableDictation = bool_enableDictation
      
        
        
    }
    
}
