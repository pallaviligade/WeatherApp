//
//  ListViewController.swift
//  VestiaireCollectionTest
//
//  Created by Pallavi on 24/11/21.
//

import UIKit
import CoreLocation
import SDWebImage
class ListViewController: UIViewController{
    // outlets
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var templbl: UILabel!
    @IBOutlet weak var headerimage: UIImageView!
    @IBOutlet weak var weatherlable: UILabel!
    // variables
    var listViewModel = ListViewModel()
    let locationManager = CLLocationManager()
    var currentLocation:CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createData()
        table.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.identifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func createData()  {
        listViewModel.bindViewModelToViewController = {
            DispatchQueue.main.async {
                self.updateHeaderLabels()
                self.table.reloadData()
            }
        }
    }
    
    func updateHeaderLabels()  {
        if let model = listViewModel.weatherMapModel {
            let list:List = model.list![0]
            weatherlable.text =  "\(listViewModel.headertitle ?? "")"
            self.headerimage.sd_setImage(with: getIconURL(name: list.weather![0].icon), placeholderImage: UIImage(named: "placeholder"), options: SDWebImageOptions(rawValue: 0), context: [:])
            self.templbl.text = String().measurmentFormatter(temp: list.temp!.max) 
        }
    }
  
    func getIconURL(name:String) -> URL {
        return URL(string: "http://openweathermap.org/img/wn/\(name)@2x.png")!
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension ListViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.weatherMapModel?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard  let cell = table.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        if let model = listViewModel.weatherMapModel {
            cell.configuareCellwithModel(list: model.list![indexPath.row])
            return cell
        }
        return UITableViewCell() // return error handling cell or logic for error screen
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let stroryborad:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stroryborad.instantiateViewController(withIdentifier: "DetailsViewControllerID") as? DetailsViewController
        vc?.list = listViewModel.weatherMapModel?.list?[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
   
}
