//
//  StudentViewController.swift
//  Student_Table
//
//  Created by mac09 on 2021/11/5.
//

import UIKit

class StudentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = stu_collection.dequeueReusableCell(withIdentifier: "stucell", for: indexPath) as! StudentCollectionViewCell
        
        let cell = stu_collection.dequeueReusableCell(withReuseIdentifier: "student_collection", for: indexPath) as! StudentCollectionViewCell
        cell.img_student.image = UIImage(named: students[indexPath.row].studPhoto)
        cell.lb_name.text = students[indexPath.row].name
        return cell
    }
   
    
    
    var students:[Student] = []
    var studentsAll:[Student] = []
    
    
    @IBOutlet weak var stu_collection: UICollectionView!
    @IBOutlet weak var sw_gender: UISegmentedControl!
    @IBOutlet weak var Student_table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        studentsAll  = getStudents(n: 11)
        
        students.removeAll()
        students =  self.selectGender(key: "", oldData: studentsAll)
        
    
        
        //collection
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 80, height: 120)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
     
        self.stu_collection.collectionViewLayout = flowLayout
        
        stu_collection.dataSource = self
        stu_collection.delegate = self
        
        Student_table.dataSource = self
        Student_table.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func seg_gender_value_changed(_ sender: Any) {
        if sw_gender.selectedSegmentIndex == 0 {
            students.removeAll()
            students =  self.selectGender(key: "", oldData: studentsAll)
              Student_table.reloadData()
            stu_collection.reloadData()
        }
        if sw_gender.selectedSegmentIndex == 1 {
            students.removeAll()
            students =  self.selectGender(key: "male", oldData: studentsAll)
              Student_table.reloadData()
            stu_collection.reloadData()
        }
        if sw_gender.selectedSegmentIndex == 2 {
            students.removeAll()
            students =  self.selectGender(key: "female", oldData: studentsAll)
              Student_table.reloadData()
            stu_collection.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Student_table.dequeueReusableCell(withIdentifier: "stucell", for: indexPath) as! StudentTableViewCell
       
        cell.img_stud.image = UIImage(named: students[indexPath.row].studPhoto)
        cell.lbl_name.text = students[indexPath.row].name
        cell.lbl_gender.text = students[indexPath.row].gender
        cell.lbl_num.text = students[indexPath.row].studnumb
        return cell
    }
    
    

    //transforming table
    func selectGender(key:String, oldData:[Student]) -> [Student] {
        var newData:[Student] = []
        if key == "" {
            for student in oldData {
                    newData.append(student)
            }
        } else{
        for student in oldData {
            if(student.gender == key){
                newData.append(student)
            }
        }
    }
        return newData
    }
    
    //cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    
    //select option
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(students[indexPath.row].name)
    }
    
    
    //delete option
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Message", message: "Are you sure you want to delete row?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                
                //delete row
                self.students.remove(at: indexPath.row)
                self.Student_table.deleteRows(at: [indexPath], with: .automatic)
                
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(ok)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
       
    }
    //datasource
    func getStudents(n:Int) -> [Student]{
        var i = 0
        var students = [Student]()
        while i < n {
            var student:Student
            if i % 2 == 0 {
             student = Student("000\(i)","Man\(i)","male","profile-user")
            }else {
                 student = Student("000\(i)","Lady\(i)","female","Settings")
            }
        students.append(student)
         
            i = i + 1
        }
        return students
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
