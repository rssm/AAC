//
//  LocalViewController.swift
//  ApoieACena
//
//  Created by Felipe Montenegro on 3/31/17.
//  Copyright © 2017 Felipe Montenegro. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
//        while (player.play()){
//            self.timeprogress = Float(self.player.currentTime)
//            Time?.progress = Float(self.player.duration) / self.timeprogress
//        }
    }
    
    @IBAction func stop(_ sender: Any) {
        player.pause()
        player.currentTime = 0
    }
    
    @IBOutlet weak var Time: UIProgressView?
  //  var timeprogress : Float = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Time?.progress = 0.0
        do{
            let audioPath = Bundle.main.path(forResource: "Fim", ofType: "wav")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL )
        }
        catch{
            print("Music not found")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
