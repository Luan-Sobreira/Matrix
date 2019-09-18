//
//  MatrixCollectionViewCell.swift
//  Vinus
//
//  Created by Luan Sobreira Eustáquio de Oliveira on 10/09/19.
//  Copyright © 2019 LUAN SOBREIRA EUSTAQUIO DE OLIVEIRA. All rights reserved.
//

import UIKit

public protocol MatrixCollectionViewCellDataSource {
    
    func numberOfLines(in matrixCollectionViewCell: MatrixCollectionViewCell) -> Int
    
    func numberOfColumns(in matrixCollectionViewCell: MatrixCollectionViewCell) -> Int
    
}

open class MatrixCollectionViewCell: UICollectionViewCell {
    
    private static let reuseIdentifier = "MatrixCell"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
//            self.tableView.delegate = self
            self.tableView.register(MatrixTableViewCell.self, forCellReuseIdentifier: MatrixCollectionViewCell.reuseIdentifier)
        }
    }
    
    open var dataSource: MatrixCollectionViewCellDataSource?
    
    private var numberOfLines: Int = 0
    
    private var numberOfColumns: Int = 0
    
    func loadNib() -> UIView? {
        guard let nibName = NSStringFromClass(type(of: self)).components(separatedBy: ".").last else {
            return nil
        }
        let bundle = Bundle(for: type(of: self))
        guard let views = bundle.loadNibNamed(nibName, owner: self, options: nil),
            let contentView = views.first as? UIView else {
                return nil
        }
        
        return contentView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        let contentView = self.loadNib()!
        self.addSubview(contentView)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = self.bounds
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.subviews.count == 0 {
            let contentView = self.loadNib()!
            self.addSubview(contentView)
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.frame = self.bounds
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tableView.backgroundColor = .blue
    }

}

extension MatrixCollectionViewCell: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.numberOfLines = self.dataSource?.numberOfLines(in: self) ?? 0
        self.numberOfColumns = self.dataSource?.numberOfColumns(in: self) ?? 0
        return self.numberOfLines
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatrixCollectionViewCell.reuseIdentifier, for: indexPath)
        let cellModel = MatrixCellModel()
        // Configure the cell
//        if (indexPath.row) {
//            
//        }
        
        if let matrixCell = cell as? MatrixTableViewCell {
            matrixCell.configureWith(cellModel: cellModel)
        }
        
        return cell
    }
    
}
