

import UIKit
import GoogleSignIn

class Login_Screen: UIViewController {

    @IBOutlet weak var name_txtfld: UITextField!
    @IBOutlet weak var email_txtfld: UITextField!
    @IBOutlet weak var pass_txtfld: UITextField!
    @IBOutlet weak var loginbtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        name_txtfld.layer.cornerRadius = 20
        name_txtfld.layer.borderWidth = 2
        name_txtfld.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        
        email_txtfld.layer.cornerRadius = 20
        email_txtfld.layer.borderWidth = 2
        email_txtfld.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        
        pass_txtfld.layer.cornerRadius = 20
        pass_txtfld.layer.borderWidth = 2
        pass_txtfld.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
        
        //Placeholder
        name_txtfld.attributedPlaceholder = NSAttributedString(
            string: "Enter Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        
        email_txtfld.attributedPlaceholder = NSAttributedString(
            string: "Email ID",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        
        pass_txtfld.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        
        //Btn creativity
        loginbtn.layer.cornerRadius = 20
        loginbtn.layer.borderWidth = 2
        loginbtn.titleLabel?.font = UIFont(name: "LexendMega-Medium", size: 15)
        loginbtn.layer.borderColor = UIColor(rgb: 0xF4DAD6).cgColor
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showAlert(title : String, message : String){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                   let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
                       let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home_Screen" ) as! Home_Screen
                       vc.receivedName = "there"
                       self.navigationController?.pushViewController(vc, animated: true)
                   }
                   alert.addAction(alertAction)
                   self.present(alert, animated: false, completion: nil)
        }
    
    @IBAction func signin(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    
    @IBAction func move_to_home(_ sender: UIButton) {
                
        let vc = storyboard?.instantiateViewController(withIdentifier: "Home_Screen" ) as! Home_Screen
        vc.receivedName = name_txtfld.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension Login_Screen : GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
                    if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                        debugPrint("The user has not signed in before or they have since signed out.")
                    } else {
                        debugPrint("\(error.localizedDescription)")
                    }
                    return
                }
                debugPrint(user.profile.email ?? "")
                debugPrint(user.profile.name ?? "")
                debugPrint(user.profile.givenName ?? "")
                debugPrint(user.profile.familyName ?? "")
                showAlert(title: "SUCCESS", message: "Thanks for signing in with google")
    }
      
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from the app here.
        // ...
    }
      
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
          
    }
      
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
