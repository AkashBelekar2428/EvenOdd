//
//  NumberViewController.swift
//  EvenOddProject
//
//  Created by Akash Belekar on 14/03/23.
//

import UIKit
struct numberModel:Equatable{
    var number:Int?
    
}

class NumberViewController: UIViewController {
    @IBOutlet weak var tbl:UITableView!
    var number:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    var numberData:[numberModel] = []
    {
        didSet{
            if numberData != oldValue{
                DispatchQueue.main.async {
                    self.tbl.reloadData()
                }
                
            }
        }
        willSet (newValue){
            self.numberData = newValue
        }
    }
    
  //MARK: Sets  Using sets
  //  var number:Set<Int> = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.register( UINib(nibName: "NumberTVC", bundle: nil), forCellReuseIdentifier: "NumberTVC")
        tbl.delegate = self
        tbl.dataSource = self
        
        for i in number{
            var data = numberModel()
            data.number = i
            numberData.append(data)
        }
    }
}
extension NumberViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberTVC", for: indexPath) as? NumberTVC
        cell?.selectionStyle = .none
        cell?.numberLbl.text = String(numberData[indexPath.row].number ?? 0)
        return cell!
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectRow:UITableViewCell = tbl.cellForRow(at: indexPath)!
        if (indexPath.row % 2 == 0) {
            selectRow.contentView.backgroundColor = .brown
        }
        else{
            selectRow.contentView.backgroundColor = .yellow
        }
        
    }
    
    
}
