//
//  MyTableViewCell.swift
//  CacheImag
//
//  Created by Terry Yang on 2017/8/11.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var iv: UIImageView!
    
    var ivUrl: NSURL! //圖片來源url
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
