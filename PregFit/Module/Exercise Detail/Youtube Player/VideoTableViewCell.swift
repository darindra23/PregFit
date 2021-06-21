//
//  VideoTableViewCell.swift
//  PregFit
//
//  Created by Peter Lee on 16/06/21.
//

import youtube_ios_player_helper
import UIKit

class VideoTableViewCell: UITableViewCell, YTPlayerViewDelegate {
    
    static let identifier = "VideoTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "VideoTableViewCell", bundle: nil)
    }
    
    var exercise: Exercise?
    
    @IBOutlet var playerView: YTPlayerView!
        
    
    var videoUrl = ""
    
    public func configure(with url: String){
        videoUrl = url
        let videoId = videoUrl.suffix(11)
        playerView.load(withVideoId: String(videoId), playerVars: ["playsinline": 1])
        
    }
    
//    func playVideo(){
//        let videoId = videoUrl.suffix(11)
//        playerView.load(withVideoId: String(videoId), playerVars: ["playsinline": 1])
//    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playerView.delegate = self
                
        
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
