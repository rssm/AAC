//
//  LocalViewController.swift
//  ApoieACena
//
//  Created by Felipe Montenegro on 3/31/17.
//  Copyright © 2017 Felipe Montenegro. All rights reserved.
//

import UIKit
import AVFoundation

class BreakevenPlayerViewController: UIViewController {
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var time: UIProgressView?
    
    var player:AVAudioPlayer = AVAudioPlayer()
    var estaTocando = false
    var imagemAtualPlayOuPause = UIImage()
    weak var timerRunning: Timer?
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func play(_ sender: Any) {
        if(estaTocando == false) {
            player.play()
            estaTocando = true
            imagemAtualPlayOuPause = UIImage(named: "ic_pause_white.png")!
            playButton.setImage(imagemAtualPlayOuPause, for: .normal)
        }
        else {
            player.pause()
            estaTocando = false
            imagemAtualPlayOuPause = UIImage(named: "ic_play_arrow_white.png")!
            playButton.setImage(imagemAtualPlayOuPause, for: .normal)
        }
        
        timerRunning = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (theTimer) in
            let timeprogress = Float(self.player.currentTime)
            self.time?.progress = timeprogress / Float(self.player.duration)
            var tempoMin:Int = Int(self.player.currentTime)/60
            var tempoSegundos = Int(self.player.currentTime)%60
            var tempoFormatado = String.init(format: "%02d:%02d", tempoMin, tempoSegundos)
            
            self.currentTimeLabel.text = "\(tempoFormatado)"
            tempoMin = Int(self.player.duration)/60
            tempoSegundos = Int(self.player.duration)%60
            tempoFormatado = String.init(format: "%02d:%02d", tempoMin, tempoSegundos)
            self.durationLabel.text = "\(tempoFormatado)"
            
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        player.pause()
        estaTocando = false
        imagemAtualPlayOuPause = UIImage(named: "ic_play_arrow_white.png")!
        playButton.setImage(imagemAtualPlayOuPause, for: .normal)
        player.currentTime = 0
        timerRunning?.invalidate()
        timerRunning = nil
    }
    
    
    //  var timeprogress : Float = 0.0
    
    func updateProgressBar() {
        let timeprogress = Float(self.player.currentTime)
        time?.progress = Float(self.player.duration) / timeprogress
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.time?.progress = 0.0
        do{
            let audioPath = Bundle.main.path(forResource: "Entre o Medo e a Coragem", ofType: "mp3")
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
