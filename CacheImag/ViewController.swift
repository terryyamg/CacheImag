//
//  ViewController.swift
//  CacheImag
//
//  Created by Terry Yang on 2017/8/11.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var url = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 重複50張圖片
        url = Array(repeating: "http://g03.a.alicdn.com/kf/HTB1hvNUIFXXXXbBXFXXq6xXFXXX2/3D-Diamond-Embroidery-Paintings-Rhinestone-Pasted-diy-Diamond-painting-cross-Stitch-font-b-coffe-b-font.jpg", count: 50)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return url.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! MyTableViewCell
        let ivUrl = NSURL(string: url[indexPath.row])
    
        cell.ivUrl = ivUrl // For recycled cells' late image loads.
        if let image = ivUrl?.cachedImage { //抓過了 -> 直接顯示
            cell.iv.image = image
            cell.iv.alpha = 1
        } else { //沒抓過 ->下載圖片
            cell.iv.alpha = 0
            // 下載圖片
            ivUrl?.fetchImage { image in
                // Check the cell hasn't recycled while loading.
                if cell.ivUrl == ivUrl {
                    cell.iv.image = image
                    UIView.animate(withDuration: 0.3) {
                        cell.iv.alpha = 1
                    }
                }
            }
        }
        
        return cell
    }
}

