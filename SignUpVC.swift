
import UIKit



class SignUpVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    
    
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtContact: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtPostal: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var pickCity: UIPickerView!
    
    
    
    var cityList : [String] = ["Toronto", "Brampton", "Mississauga", "Edmenton", "Calgary", "Vancouver"]
    
    var selectedCityIndex : Int = 0
    
    @IBAction func btnSubmit(_ sender: UIButton) {
        
        var data : String = txtName.text!
        
        data += "\n" + txtContact.text!
        
        data += "\n" + txtAddress.text!
        
        data += "\n" + txtPostal.text!
        
        data += "\n" + txtEmail.text!
        
        data += "\n" + txtPassword.text!
        
        data += "\n" + txtConfirmPassword.text!
        
        data += "\n \(pickDOB.date)"
        
        
        
        selectedCityIndex = pickCity.selectedRow(inComponent: 0)
        
        data += "\n \(cityList[selectedCityIndex])"
        
        
        
        
        
        switch segGender.selectedSegmentIndex {
            
        case 0:
            
            data += "\n Male"
            
        case 1:
            
            data += "\n Female"
            
            
            
        case 2:
            
            data += "\n No Disclosure"
            
            
            
        default:
            
            data += "\n No Disclosure"
            
        }
        
        
        
        let infoAlert = UIAlertController (title: "Confirm Details", message: data, preferredStyle: .alert)
        
        if txtPassword.text != txtConfirmPassword.text {
            
            infoAlert.message = "Both passwords must be same"
            
        }
            
        else {
            
            infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: nil))
            
        }
        
        
        
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        
        
        self.present(infoAlert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    @IBOutlet weak var pickDOB: UIDatePicker!
    
    
    
    @IBOutlet weak var segGender: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        pickCity.dataSource = self
        
        pickCity.delegate = self
        
        
        
        // Do any additional setup after loading the view.
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return cityList.count
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        return cityList[row]
        
    }
    
    
    
    func displayHomeVC() {
        
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let homeVC = mainSB.instantiateViewController(withIdentifier: "HomeScene")
        
        navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
    
    
}


