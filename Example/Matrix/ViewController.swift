//
//  ViewController.swift
//  Matrix
//
//  Created by Luan-Sobreira on 09/11/2019.
//  Copyright (c) 2019 Luan-Sobreira. All rights reserved.
//

import UIKit
import Matrix

class ViewController: UIViewController {

    @IBOutlet weak var matrixView: MatrixView! {
        didSet {
            self.matrixView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: MatrixViewDataSource {
    
    func numberOfLines(in matrixView: MatrixView) -> Int {
        return 3
    }
    
    func numberOfColumns(in matrixView: MatrixView) -> Int {
        return 3
    }
    
}

