

import Foundation
import UIKit
import Kingfisher
import SwiftUI
import struct Kingfisher.KFImage
@ViewBuilder
func KingFisherImageView(url: String, placeholder: String) -> KFImage {
    KFImage(
        URL(string: url)
    ).placeholder{
       // Image(placeholder).font(.largeTitle).opacity(0.25)
    }  .onProgress { receivedSize, totalSize in  }
        .onSuccess { result in  }
        .onFailure { error in }
        .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
}


extension UIImageView{
    
    func downloadImage(url : String? , placeHolder : UIImage?){
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        |> RoundCornerImageProcessor(cornerRadius: 20)
        self.kf.indicatorType = .activity
        let urlImg = URL(string: url ?? "")
        self.kf.setImage(
            with: urlImg ,
            placeholder: placeHolder,
            options: [
            .processor(processor) ,
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)) ,
            .cacheOriginalImage ,
        ]
    )
    }
    
    func roundedImage(){
        self.contentMode = .scaleAspectFit
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.label.cgColor
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
