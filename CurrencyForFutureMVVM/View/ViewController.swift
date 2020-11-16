//
//  ViewController.swift
//  CurrencyForFutureMVC
//
//  Created by Маргарита Черняева on 11/5/20.
//

import UIKit

class ViewController: UIViewController {
    
 

    @IBOutlet weak var tableView: UITableView!
    var cellIdentifier = "cell"
    var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel(delegate: self)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel?.getData()
    }
    
        
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel!.getCurrencyCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CurrencyTableViewCell
        let item = viewModel!.getItem(row: indexPath.row)
        let imageAndSymbal = viewModel!.findSymbolAndImageName(currencyCode: item.cur_Abbreviation!)
        
        cell.flagImageView.image = UIImage(named: imageAndSymbal.cur_FlagImageName )
        cell.officialRateLabel.text = "\(item.cur_OfficialRate ?? 0.00) BYN"
        cell.curNameLabel.text = "\(item.cur_Abbreviation ?? "Mistake") 1 \(imageAndSymbal.cur_Symbol ) = "
        
        var date = item.date
        let range = (date?.index(item.date!.endIndex, offsetBy: -9))!..<date!.endIndex
        date?.removeSubrange(range)
        cell.todayLabel.text = date
        return cell
    }
    
   
    
}
extension ViewController: ViewModelDelegate {
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "Mistake", message: "Try again", preferredStyle: .alert)
        let butOK = UIAlertAction(title: "OK", style: .default, handler: nil)
       alert.addAction(butOK)
        present(alert, animated: true)    }

}

