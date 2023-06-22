//
//  UpdateJobStatusTableViewCell.swift
//  GoodWork
//
//  Created by Gaurav Jani on 15/05/23.
//

import UIKit

class UpdateJobStatusTableViewCell: UITableViewCell {

    static let reuseCellIdentifier = "UpdateJobStatusTableViewCell"
    
    @IBOutlet weak var selectedJobImage: UIImageView!
    @IBOutlet weak var jobStatusTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setUpUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpUI(){
        
        self.selectedJobImage.image = UIImage(named: "autoOffer")
        
        self.jobStatusTitleLabel.addTitleColorAndFont(title: "Resume", fontName: GoodWorkAppFontName.NeueKabelMedium, fontSize: 16, tintColor: GoodWorkAppColor.appDarkPurple)
    }
    
}
