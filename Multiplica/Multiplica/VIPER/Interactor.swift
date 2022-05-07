//
//  Interactor.swift
//  Multiplica
//
//  Created by Asesoftware on 6/05/22.
//

import Foundation

class TimeInteractor:PresenterToInteractorTimerProtocol{
    var presenter: InteractorToPresentTimerProtocol?
    
    func fetchTimer(rDataTime: String, rDataTimeM: String) {
        
        var localNumSec = Int(rDataTime)!
        var localNumMin = Int(rDataTimeM)!
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if localNumSec >= 0 {
                print ("\(localNumMin) Minutes \(localNumSec) Seconds")
                if localNumSec == 0 && localNumMin > 0{
                    localNumMin -= 1
                    localNumSec = 60
                }
                DispatchQueue.main.async  {
                    self.presenter?.timerSuccess(iDataTime: "\(localNumMin) Minutes \(localNumSec) Seconds")
                    localNumSec -= 1
                }
                
            } else {
                self.presenter?.timerFinish()
                Timer.invalidate()
            }
        }
    
    }
    

    
}
