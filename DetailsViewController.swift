//
//  DetailsViewController.swift
//  VestiaireCollectionTest
//
//  Created by Pallavi on 24/11/21.
//

import UIKit
import SDWebImage
class DetailsViewController: UIViewController {

    @IBOutlet weak var headerDatelable: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var currentTemplabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxlabel: UILabel!
    @IBOutlet weak var discriptionlabel: UILabel!
    var list:List?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        updateUI()
    }
  
    func updateUI()  {
        maxlabel.text = "Day \(String().measurmentFormatter(temp: list?.temp?.day ?? 0))"
        minLabel.text = "Night \(String().measurmentFormatter(temp: list?.temp?.night ?? 0))"
        let date = String().getdayFromDt(dt: list?.dt ?? 0)
        headerDatelable.text = date
        self.image.sd_setImage(with: getIconURL(name: list?.weather![0].icon ?? ""), placeholderImage: UIImage(named: "placeholder"), options: SDWebImageOptions(rawValue: 0), context: [:])
       
        if let max = list?.temp?.max
        {
        switch max
         {
            case _ where max > 25:
                weatherStatusLabel.text = "HOT"
                break
            case ..<10:
                weatherStatusLabel.text = "Cold"
                break
            default:break
         }
        }
        currentTemplabel.text = String().measurmentFormatter(temp: list?.temp?.max ?? 0)
        discriptionlabel.text = list?.weather?[0].weatherDescription
        feelsLikeLabel.text = "Feels Like \(String().measurmentFormatter(temp: list?.feelsLike.day ?? 0))"
    }
    
    func getIconURL(name:String) -> URL {
        return URL(string: "http://openweathermap.org/img/wn/\(name)@2x.png")!
    }
    
  
}
