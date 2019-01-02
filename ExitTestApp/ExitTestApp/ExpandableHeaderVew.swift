//
//  ExpandableHeaderVew.swift
//  ExitTestApp
//
//  Created by Kirankumar Bollem on 12/28/18.
//  Copyright © 2018 Kirankumar Bollem. All rights reserved.
//

import UIKit

protocol ExpandableHeaderviewDelagate {
    func toggleSection(header: ExpandableHeaderVew, section: Int)
    }

class ExpandableHeaderVew: UITableViewHeaderFooterView {
    var delegate: ExpandableHeaderviewDelagate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer){
        let cell = gestureRecognizer.view as! ExpandableHeaderVew
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func customInit(title: String, section: Int, delegate: ExpandableHeaderviewDelagate){
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor.darkGray
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
