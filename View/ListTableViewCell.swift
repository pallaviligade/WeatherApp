//
//  ListTableViewCell.swift
//  VestiaireCollectionTest
//
//  Created by Pallavi on 24/11/21.
//

import UIKit
import SDWebImage
class ListTableViewCell: UITableViewCell {
static let identifier = "ListTableViewCellID"
    
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    static func nib() -> UINib{
        return   UINib (nibName: "ListTableViewCell", bundle: nil)
    }
    func configuareCellwithModel(list:List)  {
        self.day.text =  String().getdayFromDt(dt: list.dt)
        if  let weatherCondition = list.weather{
            self.weatherConditionLabel.text = "\(weatherCondition[0].main)"
            self.iconImage.sd_setImage(with: getIconURL(name: weatherCondition[0].icon), placeholderImage: UIImage(named: "placeholder"), options: SDWebImageOptions(rawValue: 0), context: [:])
        }
        self.lowTempLabel.text = String().measurmentFormatter(temp: list.temp!.min)
        self.highTempLabel.text = String().measurmentFormatter(temp: list.temp!.max)
    }
    
    
    func getIconURL(name:String) -> URL {
        return URL(string: "http://openweathermap.org/img/wn/\(name)@2x.png")!
    }
}
