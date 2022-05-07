//
//  ViewController.swift
//  Multiplica
//
//  Created by Asesoftware on 6/05/22.
//

import UIKit


class ViewController: UIViewController,PresenterToViewTimerProtocol{
    
    var timePresenter:ViewToPresenterTimerProtocol?
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var pickerTimer: UIPickerView!
    
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    var localNumMin = 0
    var localNumSec = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pickerTimer.delegate = self
        self.pickerTimer.dataSource = self
    }
    
    @IBAction func goData(_ sender: UIButton) {
        
        timePresenter?.startFetchingTimer(vDataTime: String(self.localNumSec), vDataTimeM: String(self.localNumMin))
    }
    
    func dataSuccessTime(pDataTime: String) {
        
        self.lbTime!.text = pDataTime
        self.pickerTimer.isUserInteractionEnabled = false
    }
    
    func dataFinishTime() {
        showAlertFinish()
        self.pickerTimer.isUserInteractionEnabled = true
    }
    
    func showAlertFinish(){
        // Create the alert controller
        let alertController = UIAlertController(title: "Time", message: "The time finished", preferredStyle: .alert)

         // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
             UIAlertAction in
         }

         // Add the actions
         alertController.addAction(okAction)

         // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if component == 0 {
          return minutes.count
      }
      else {
          return seconds.count
      }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
        return String(minutes[row])
        } else {
        return String(seconds[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            self.localNumMin = minutes[row]
        } else {
            self.localNumSec = seconds[row]
        }
        
    }
    
}

