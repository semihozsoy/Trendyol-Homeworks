//
//  CookListViewController.swift
//  TabbarCoredataAll
//
//  Created by Semih Özsoy on 13.05.2021.
//

import UIKit
import CoreData

class CookListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
  
    var cookNames = [String]()
    var cookImages = [Data]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCooks()
    }
    
    private func getCooks(){
        cookNames.removeAll()
        cookImages.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "name") as? String else {return}
                    guard let image = result.value(forKey: "image") as? Data else {return}
                    cookNames.append(name)
                    cookImages.append(image)
                }
                self.tableView.reloadData()
            }else {
                
            }
        } catch  {
            print("error")
        }
        
    }

}

extension CookListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath) as! CookTableViewCell
        cell.config(data: cookImages[indexPath.row])
    
        cell.textLabel?.text = cookNames[indexPath.row]
        return cell
    }
    
    
}
