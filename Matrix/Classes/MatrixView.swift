//
//  MatrixView.swift
//  Vinus
//
//  Created by Luan Sobreira Eustáquio de Oliveira on 10/09/19.
//  Copyright © 2019 LUAN SOBREIRA EUSTAQUIO DE OLIVEIRA. All rights reserved.
//

import UIKit

public protocol MatrixViewDataSource: class {
    
    func numberOfLines(in matrixView: MatrixView) -> Int
    
    func numberOfColumns(in matrixView: MatrixView) -> Int
    
}

public protocol MatrixViewDelegate: class {
    
    func cellWidth(in matrixView: MatrixView) -> CGFloat
    
}

@IBDesignable open class MatrixView: UIView {
    
    private static let reuseIdentifier = "MatrixVerticalCell"
    
    @IBOutlet weak var matrixCollectionView: UICollectionView! {
        didSet {
            self.matrixCollectionView.delegate = self
            self.matrixCollectionView.dataSource = self
        }
    }
    
    
    // MARK: - IBInspectable properties
    
    /// Has external border, default false
    @IBInspectable var hasExternalBorder: Bool = false
    
    /// Has internal border, default false
    @IBInspectable var hasInternalBorder: Bool = false
    
    /// Border thickness, default is 1.0
    @IBInspectable var borderThickness: CGFloat = 1.0
    
    // MARK: - Properties
    
    open var dataSource: MatrixViewDataSource?
    
    open var delegate: MatrixViewDelegate?
    
    /// Cell size, default is 10.0 x 10.0
    private(set) public var cellSize: CGSize = CGSize(width: 10.0, height: 10.0)
    
    private var numberOfLines: Int = 0
    
    private var numberOfColumns: Int = 0
    
    private var cellList: [MatrixCollectionViewCell] = []
    
    private var scrollPositionY: CGFloat = 0.0
    
    private var selectedScrollView: UIScrollView?
    
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
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if self.subviews.count == 0 {
            let contentView = self.loadNib()!
            self.addSubview(contentView)
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.frame = self.bounds
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.matrixCollectionView.register(MatrixCollectionViewCell.self, forCellWithReuseIdentifier: MatrixView.reuseIdentifier)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.selectedScrollView == scrollView || self.selectedScrollView == nil {
            self.selectedScrollView = scrollView
            if self.cellList.contains(where: { (cell) -> Bool in
                scrollView == cell.tableView
            }) {
                self.synchronizeScrollView(withScrollView: scrollView)
                self.scrollPositionY = scrollView.contentOffset.y
            }
            self.selectedScrollView = nil
        }
    }
    
    private func synchronizeScrollView(withScrollView scrolledView: UIScrollView) {
        for cell in self.cellList where cell.tableView != scrolledView {
            var offset = cell.tableView.contentOffset
            offset.y = scrolledView.contentOffset.y
            
            cell.tableView.setContentOffset(offset, animated: false)
        }
    }
    
}

// MARK: UICollectionViewDelegate
extension MatrixView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.delegate?.cellWidth(in: self) ?? self.frame.size.width / 3
        return CGSize(width: width, height: self.frame.size.height)
    }
    
}

// MARK: - UICollectionViewDataSource
extension MatrixView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.numberOfColumns = self.dataSource?.numberOfColumns(in: self) ?? 0
        self.numberOfLines = self.dataSource?.numberOfLines(in: self) ?? 0
        self.cellList = []
        return self.numberOfColumns
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatrixView.reuseIdentifier, for: indexPath)
        
        // Configure the cell
        
        if let matrixCell = cell as? MatrixCollectionViewCell {
            matrixCell.dataSource = self
            (matrixCell.tableView as? UIScrollView)?.delegate = self
            self.cellList.append(matrixCell)
        }
        
        return cell
    }
    
}

extension MatrixView: MatrixCollectionViewCellDataSource {
    
    public func numberOfLines(in matrixCollectionViewCell: MatrixCollectionViewCell) -> Int {
        return self.numberOfLines
    }
    
    public func numberOfColumns(in matrixCollectionViewCell: MatrixCollectionViewCell) -> Int {
        return self.numberOfColumns
    }
    
}
