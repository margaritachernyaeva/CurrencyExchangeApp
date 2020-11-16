//
//  CountryRateTableViewCell.swift
//  CurrencyForFutureMVC
//
//  Created by Маргарита Черняева on 11/5/20.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var curNameLabel: UILabel!
    @IBOutlet weak var officialRateLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }

}
