//
//  ViewController.swift
//  LandmarkBookProject
//
//  Created by Begüm Sude Bölükbaş on 23.12.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // UITableView kendi başına ne göstereceğini ve nasıl davranacağını bilmez bu sebepten UITableViewDelegate ve UITableViewDataSource protokollerine ihtiyaç duyar.
    /* 📌 DataSource → “Ne göstereceğim?”
    Kaç satır var?
    Her hücrede ne yazacak?
    Hangi hücre tipi kullanılacak?
    📌 Delegate → “Nasıl davranacağım?”
    Hücreye tıklandığında ne olacak?
    Satır yüksekliği ne?
    Kaydırma, seçim, animasyonlar vs.
     */

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Jungfraujoch")
        landmarkNames.append("Kapellbrücke")
        landmarkNames.append("Matterhorn")
        landmarkNames.append("Old Town Bern")
        
        
        landmarkImages.append(UIImage(named: "Jungfraujoch")!)
        landmarkImages.append(UIImage(named: "Kapellbrücke (Chapel Bridge)")!)
        landmarkImages.append(UIImage(named: "Matterhorn")!)
        landmarkImages.append(UIImage(named: "Old Town Bern (Bern Altstadt)")!)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               landmarkNames.remove(at: indexPath.row)
               landmarkImages.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
           }
       }
       
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // cell.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        content.secondaryText = "Switzerland"
        //content.image = landmarkImages[indexPath.row]
        cell.contentConfiguration = content
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandMarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    


}




