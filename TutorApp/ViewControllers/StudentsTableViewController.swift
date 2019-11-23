//
//  StudentsTableViewController.swift
//  TutorApp
//
//  Created by Valeriy on 21.11.2019.
//  Copyright © 2019 Валерий Зубаиров. All rights reserved.
//
import UIKit
import Firebase

class StudentsTableViewController: UITableViewController {

    var students = [StudentTable]()
    private func loadSample() {
        let s1 = StudentTable(studentName: "жопа с ручкой", profileImage: "1241241151")
        let s2 = StudentTable(studentName: "Ручка с жопой", profileImage: "1241241151")
        let s3 =  StudentTable(studentName: "Вася Петров", profileImage: "1241241151")
        
        students += [s1,s2,s3]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSample()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    private func loadStudents() {
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentidier = "StudentTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier, for: indexPath) as? StudentTableViewCell else {
            fatalError("The dequeued cell is not an instance of StudentTableViewCell.")
        }
        
        let student = students[indexPath.row]
        
        let storage = Storage.storage()
        
        let pathReference = storage.reference(withPath: "images/\(student.profileImageUrl).png")
            print(student.profileImageUrl)
            pathReference.getData(maxSize: 20 * 1024 * 1024) { data, error in
              if let error = error {
                print(error)
              } else {
                let image = UIImage(data: data!)
                cell.profileImage.image = image
                print("image")
              }
            }
        
        cell.profileName.text = student.name

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


