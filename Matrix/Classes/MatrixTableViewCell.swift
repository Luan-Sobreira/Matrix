//
//  MatrixTableViewCell.swift
//  Matrix
//
//  Created by Luan Sobreira Eustáquio de Oliveira on 11/09/19.
//

import UIKit

class MatrixTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leadingTopView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var traillingTopView: UIView!
    @IBOutlet weak var leadingView: UIView!
    @IBOutlet weak var view: UIView! {
        didSet {
            print("")
        }
    }
    @IBOutlet weak var traillingView: UIView!
    @IBOutlet weak var leadingBottomView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var traillingBottomView: UIView!
    
    @IBOutlet weak var cnsLeadingTopViewWidth: NSLayoutConstraint!
    @IBOutlet weak var cnsLeadingTopViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cnsTopViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cnsTraillingTopViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cnsTraillingTopViewWidth: NSLayoutConstraint!
    @IBOutlet weak var cnsLeadingViewWidth: NSLayoutConstraint!
    @IBOutlet weak var cnsTraillingViewWidth: NSLayoutConstraint!
    @IBOutlet weak var cnsLeadingBottomViewWidth: NSLayoutConstraint!
    @IBOutlet weak var cnsLeadingBottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cnsBottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cnsTraillingBottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var cnsTraillingBottomViewWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func setColor(_ color: UIColor) {
        self.topView.backgroundColor = color
        self.bottomView.backgroundColor = color
        self.leadingView.backgroundColor = color
        self.traillingView.backgroundColor = color
        self.leadingTopView.backgroundColor = color
        self.leadingBottomView.backgroundColor = color
        self.traillingTopView.backgroundColor = color
        self.traillingBottomView.backgroundColor = color
    }
    
    fileprivate func setSize(_ size: CGFloat) {
        self.cnsLeadingTopViewWidth.constant = size
        self.cnsLeadingTopViewHeight.constant = size
        self.cnsTopViewHeight.constant = size
        self.cnsTraillingTopViewHeight.constant = size
        self.cnsTraillingTopViewWidth.constant = size
        self.cnsLeadingViewWidth.constant = size
        self.cnsTraillingViewWidth.constant = size
        self.cnsLeadingBottomViewWidth.constant = size
        self.cnsLeadingBottomViewHeight.constant = size
        self.cnsBottomViewHeight.constant = size
        self.cnsTraillingBottomViewHeight.constant = size
        self.cnsTraillingBottomViewWidth.constant = size
    }
    
    open func configureWith(cellModel: MatrixCellModel) {
        
        self.setColor(cellModel.borderColor)
        
        self.setSize(cellModel.borderSize)
        
//        self.topView
//        self.bottomView
//        self.leadingView
//        self.traillingView
//        self.leadingTopView
//        self.leadingBottomView
//        self.traillingTopView
//        self.traillingBottomView
        
        switch cellModel.position {
        case .top:
            // Inner Border
            self.leadingView.isHidden = !cellModel.hasInnerBorder
            self.traillingView.isHidden = !cellModel.hasInnerBorder
            self.bottomView.isHidden = !cellModel.hasInnerBorder
            self.leadingBottomView.isHidden = !cellModel.hasInnerBorder
            self.traillingBottomView.isHidden = !cellModel.hasInnerBorder
            
            // Outer Border
            self.topView.isHidden = !cellModel.hasOuterBorder
            self.leadingTopView.isHidden = !cellModel.hasOuterBorder
            self.traillingTopView.isHidden = !cellModel.hasOuterBorder
            break
        case .bottom:
            // Inner Border
            self.leadingView.isHidden = !cellModel.hasInnerBorder
            self.traillingView.isHidden = !cellModel.hasInnerBorder
            self.topView.isHidden = !cellModel.hasInnerBorder
            self.leadingTopView.isHidden = !cellModel.hasInnerBorder
            self.traillingTopView.isHidden = !cellModel.hasInnerBorder
            
            // Outer Border
            self.bottomView.isHidden = !cellModel.hasOuterBorder
            self.leadingBottomView.isHidden = !cellModel.hasOuterBorder
            self.traillingBottomView.isHidden = !cellModel.hasOuterBorder
            break
        case .leading:
            // Inner Border
            self.traillingView.isHidden = !cellModel.hasInnerBorder
            self.topView.isHidden = !cellModel.hasInnerBorder
            self.traillingTopView.isHidden = !cellModel.hasInnerBorder
            self.bottomView.isHidden = !cellModel.hasInnerBorder
            self.traillingBottomView.isHidden = !cellModel.hasInnerBorder
            
            // Outer Border
            self.leadingView.isHidden = !cellModel.hasOuterBorder
            self.leadingTopView.isHidden = !cellModel.hasOuterBorder
            self.leadingBottomView.isHidden = !cellModel.hasOuterBorder
            break
        case .trailling:
            // Inner Border
            self.topView.isHidden = !cellModel.hasInnerBorder
            self.bottomView.isHidden = !cellModel.hasInnerBorder
            self.leadingView.isHidden = !cellModel.hasInnerBorder
            self.leadingTopView.isHidden = !cellModel.hasInnerBorder
            self.leadingBottomView.isHidden = !cellModel.hasInnerBorder
            
            // Outer Border
            self.traillingView.isHidden = !cellModel.hasOuterBorder
            self.traillingTopView.isHidden = !cellModel.hasOuterBorder
            self.traillingBottomView.isHidden = !cellModel.hasOuterBorder
            break
        case .leadingTop:
            // Inner Border
            self.traillingView.isHidden = !cellModel.hasInnerBorder
            self.traillingBottomView.isHidden = !cellModel.hasInnerBorder
            self.bottomView.isHidden = !cellModel.hasInnerBorder
            
            // Outer Border
            self.topView.isHidden = !cellModel.hasOuterBorder
            self.leadingView.isHidden = !cellModel.hasOuterBorder
            self.leadingTopView.isHidden = !cellModel.hasOuterBorder
            self.leadingBottomView.isHidden = !cellModel.hasOuterBorder
            self.traillingTopView.isHidden = !cellModel.hasOuterBorder
            break
        case .leadingBottom:
            // Inner Border
            self.topView.isHidden = !cellModel.hasInnerBorder
            self.traillingView.isHidden = !cellModel.hasInnerBorder
            self.traillingTopView.isHidden = !cellModel.hasInnerBorder
            
            // Outer Border
            self.leadingView.isHidden = !cellModel.hasOuterBorder
            self.leadingTopView.isHidden = !cellModel.hasOuterBorder
            self.leadingBottomView.isHidden = !cellModel.hasOuterBorder
            self.traillingBottomView.isHidden = !cellModel.hasOuterBorder
            self.bottomView.isHidden = !cellModel.hasOuterBorder
            break
        case .traillingTop:
            // Inner Border
            self.leadingView.isHidden = !cellModel.hasInnerBorder
            self.leadingBottomView.isHidden = !cellModel.hasInnerBorder
            self.bottomView.isHidden = !cellModel.hasInnerBorder
            
            // Outer Border
            self.topView.isHidden = !cellModel.hasOuterBorder
            self.traillingView.isHidden = !cellModel.hasOuterBorder
            self.traillingTopView.isHidden = !cellModel.hasOuterBorder
            self.leadingTopView.isHidden = !cellModel.hasOuterBorder
            self.traillingBottomView.isHidden = !cellModel.hasOuterBorder
            break
        case .traillingBottom:
            // Inner Border
            self.leadingView.isHidden = !cellModel.hasInnerBorder
            self.topView.isHidden = !cellModel.hasInnerBorder
            self.leadingTopView.isHidden = !cellModel.hasInnerBorder
            
            // Outer Border
            self.leadingBottomView.isHidden = !cellModel.hasOuterBorder
            self.bottomView.isHidden = !cellModel.hasOuterBorder
            self.traillingView.isHidden = !cellModel.hasOuterBorder
            self.traillingTopView.isHidden = !cellModel.hasOuterBorder
            self.traillingBottomView.isHidden = !cellModel.hasOuterBorder
            break
        case .inner:
            // Inner Border
            self.leadingView.isHidden = !cellModel.hasInnerBorder
            self.topView.isHidden = !cellModel.hasInnerBorder
            self.leadingTopView.isHidden = !cellModel.hasInnerBorder
            self.leadingBottomView.isHidden = !cellModel.hasInnerBorder
            self.bottomView.isHidden = !cellModel.hasInnerBorder
            self.traillingView.isHidden = !cellModel.hasInnerBorder
            self.traillingTopView.isHidden = !cellModel.hasInnerBorder
            self.traillingBottomView.isHidden = !cellModel.hasInnerBorder
            break
        }
    }
    
}
