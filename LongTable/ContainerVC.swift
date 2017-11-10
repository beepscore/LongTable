//
//  ContainerVC.swift
//  LongTable
//
//  Created by Steve Baker on 8/3/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    var item: Item?

    var nameLabel: UILabel?
    var noteLabel: UILabel?


    // MARK: - view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNameLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - configure labels

    func configureNameLabel() {
        nameLabel = constrainedLabel(in: view)
        nameLabel?.text = item?.name
        let nameTappedRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(ContainerVC.nameTapped(_:)))
        nameLabel?.addGestureRecognizer(nameTappedRecognizer)
    }

    func configureNoteLabel() {
        noteLabel = constrainedLabel(in: view)
        noteLabel?.backgroundColor = .lightGray
        noteLabel?.text = item?.note
        let noteTappedRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(ContainerVC.noteTapped(_:)))
        noteLabel?.addGestureRecognizer(noteTappedRecognizer)
    }

    func constrainedLabel(in parentView: UIView) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        parentView.addSubview(label)
        constrainInnerView(label, to: parentView)
        label.isUserInteractionEnabled = true
        return label
    }

    func constrainInnerView(_ innerView: UIView, to outerView: UIView) {
        // https://stackoverflow.com/questions/26180822/swift-adding-constraints-programmatically
        innerView.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSLayoutAttribute] = [.top, .bottom, .right, .left]
        NSLayoutConstraint.activate(attributes.map {
            NSLayoutConstraint(item: innerView, attribute: $0, relatedBy: .equal,
                               toItem: outerView, attribute: $0, multiplier: 1, constant: 0)
        })
    }

    // MARK: - handle tap gestures

    @objc func nameTapped(_ sender: UITapGestureRecognizer) {

        UIView.transition(with: view,
                          duration: 0.2,
                          // options: [UIViewAnimationOptions.transitionCurlUp],
                          options: [UIViewAnimationOptions.transitionFlipFromTop],
                          animations: {
                            self.nameLabel?.removeFromSuperview()
                            self.configureNoteLabel()
        },
                          completion: nil
        )
    }

    @objc func noteTapped(_ sender: UITapGestureRecognizer) {

        UIView.transition(with: view,
                          duration: 0.2,
                          // options: [UIViewAnimationOptions.transitionCurlDown],
                          options: [UIViewAnimationOptions.transitionFlipFromTop],
                          animations: {
                            self.noteLabel?.removeFromSuperview()
                            self.configureNameLabel()
        },
                          completion: nil
        )
    }

}
