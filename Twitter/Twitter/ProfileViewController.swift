//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Nurlybek Mussin on 11.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit
import Firebase
class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var tweets: [Tweet] = []
    private var users: [Users] = []
    private var dbRef: DatabaseReference?
    private var userRef: DatabaseReference?
    var current_user_email = {
        return Auth.auth().currentUser?.email
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = current_user_email()
        dbRef = Database.database().reference()
        dbRef = dbRef?.child("tweets")
        dbRef?.observe(DataEventType.value, with: { (snapshot) in
            print(snapshot.childrenCount)
            self.tweets.removeAll()
            for snap in snapshot.children{
                let tweet = Tweet.init(snap as! DataSnapshot)
                self.tweets.append(tweet)
            }
            self.tweets.reverse()
            self.tableView.reloadData()
        })
        
        fullname.text = "Nurlybek Mussin"
        birthdate.text = "26/12/1998"
        
        userRef = Database.database().reference()
        userRef = dbRef?.child("users")
        userRef?.observe(DataEventType.value, with: { (snapshot) in
            print(snapshot.childrenCount)
            self.users.removeAll()
            for snap in snapshot.children{
                let user = Users.init(snap as! DataSnapshot)
                self.users.append(user)
            }
            //self.fullname.text = self.users[].Fullname
            //self.birthdate.text = self.users[].Birthdate
        })
        // Do any additional setup after loading the view.
    }

    @IBAction func addTweetPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Add new Tweet", message: "What's up?", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "text of your tweet"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "#hashtag"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "time you have composed the post"
        }
        let postAction = UIAlertAction(title: "Post", style: .default) { (_ ) in
            let tweet = Tweet.init(alertController.textFields![0].text!, alertController.textFields![1].text!, alertController.textFields![2].text!, self.current_user_email()!)
            self.dbRef?.childByAutoId().setValue(tweet.toJSONFormat())
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(postAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func editProfilePressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Edit your profile", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Your Fullname"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Your Birthdate(dd/mm/yyyy)"
        }
        let postAction = UIAlertAction(title: "Edit", style: .default) { (_ ) in
            if(alertController.textFields![0].text != ""){
                if(alertController.textFields![1].text != ""){
                    self.fullname.text = alertController.textFields![0].text
                    self.birthdate.text = alertController.textFields![1].text
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addAction(postAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
            do{
                try Auth.auth().signOut()
            }catch{
        
            }
            presentingViewController?.dismiss(animated: true, completion: nil)
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! TableViewCell
        cell.tweetText.text = tweets[indexPath.row].Context
        cell.username.text = tweets[indexPath.row].Username
        cell.time.text = tweets[indexPath.row].Time
        cell.hashtag.text = tweets[indexPath.row].Hashtag
        if current_user_email() == tweets[indexPath.row].Username{
            cell.backgroundColor = UIColor.yellow
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
