//
//  FilteredSurveyCell.swift
//  surveyApp
//
//  Created by Emily Su on 12/6/16.
//  Copyright © 2016 Annette Chen. All rights reserved.
//

import UIKit

class FilteredSurveyCell: UITableViewCell {
    
    @IBOutlet weak var surveyTitle: UILabel!
    @IBOutlet weak var surveyDesc: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var points: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
