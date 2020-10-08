//
//  TableViewController.swift
//  Demo-Week7
//
//  Created by Shaila Zaman on 10/7/20.
//  Copyright © 2020 Shaila Zaman. All rights reserved.
//

import UIKit

struct DemoInfo: Codable{
    init(){
        name = ""
        age = 0
        image = URL(string: "http://www.cpl.uh.edu/courses/ubicomp/fall2020/webservice/images/0.png")!
    }
    
    let name: String
    let age: Int
    let image: URL
}


class TableViewController: UITableViewController {
    
    var information = [DemoInfo]()
    var selectedInformation = DemoInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://www.cpl.uh.edu/courses/ubicomp/fall2020/webservice/demo_test.json")
        if url != nil{
            getData(url: url!)
        }
    }
    
    func getData(url: URL){
        let task = URLSession.shared.dataTask(with: url){ (data,response,error) in
            if let data = data {
                do{
                    let jsonDecoder = JSONDecoder()
                    let informations = try jsonDecoder.decode(Array<DemoInfo>.self, from: data)
                    print(informations)

                    self.information = informations
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                } catch {
                    print("Error trying to decode JSON")
                }


            }else if let error=error{
                print(error.localizedDescription)
            }

        }
        task.resume()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return information.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "my_cell", for: indexPath)

            // Configure the cell...
            let img = cell.viewWithTag(1) as! UIImageView
            let label_age = cell.viewWithTag(2) as! UILabel

            label_age.text = information[indexPath.row].name

            let url = information[indexPath.row].image
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                DispatchQueue.main.async {
                    img.image = UIImage(data: data!)
                }
            }).resume()

            return cell
        }

        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 140
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "seg_1" {
                let seg = segue.destination as! ViewController
                seg.passedData = selectedInformation

            }
        }

        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedInformation = information[indexPath.row]
            self.performSegue(withIdentifier: "seg_1", sender: self)
        }

}
