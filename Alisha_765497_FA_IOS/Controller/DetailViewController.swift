//
//  DetailViewController.swift
//  Alisha_765497_FA_IOS
//
//  Created by Alisha Thind on 2020-01-25.
//  Copyright © 2020 Alisha Thind. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var IdLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    var showDetail: Products?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        IdLabel.text = "\(showDetail?.id ?? 0) "
        priceLabel.text = "\(showDetail?.name)"
        NameLabel.text = "\(showDetail?.price ?? 0)"
        descLabel.text = "\(showDetail?.description)"
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
