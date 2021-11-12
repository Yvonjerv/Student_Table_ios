//
//  StudentTableViewCell.swift
//  Student_Table
//
//  Created by mac09 on 2021/11/5.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_gender: UILabel!
    @IBOutlet weak var lbl_num: UILabel!
    @IBOutlet weak var img_stud: UIImageView!
    @IBOutlet weak var lbl_name: UILabel!
    override func awakeFromNib() {

        super.awakeFromNib()
        img_stud.layer.cornerRadius = 30
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
