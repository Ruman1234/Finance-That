//
//  RangeSliderTableViewCell.swift
//  Finance
//
//  Created by Ammar Irfan on 26/03/2021.
//  Copyright © 2021 Ammar Irfan. All rights reserved.
//

import UIKit
import RangeSeekSlider

class RangeSliderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rangeSlider: RangeSeekSlider!{
        didSet{
            rangeSlider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }
    }
//    @IBOutlet fileprivate weak var rangeSlider: RangeSeekSlider!
//    @IBOutlet fileprivate weak var rangeSliderCustom: RangeSeekSlider!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        rangeSlider.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

extension RangeSliderTableViewCell: RangeSeekSliderDelegate {

    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat) {
        if slider === rangeSlider {
            print("Standard slider updated. Min Value: \(minValue) Max Value: \(maxValue)")
        } 
    }

    func didStartTouches(in slider: RangeSeekSlider) {
        print("did start touches")
    }

    func didEndTouches(in slider: RangeSeekSlider) {
        print("did end touches")
    }
}
