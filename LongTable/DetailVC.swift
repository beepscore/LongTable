//
//  DetailVC.swift
//  LongTable
//
//  Created by Steve Baker on 8/2/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var item: Item?

    @IBOutlet weak var containerView: UIView!
    var nameLabel: UILabel?
    var noteLabel: UILabel?


    override func viewDidLoad() {
        super.viewDidLoad()

        configureNameLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configureNameLabel() {
        nameLabel = UILabel()
        nameLabel?.font = UIFont.systemFont(ofSize: 24)
        nameLabel?.textAlignment = .center
        self.containerView.addSubview(nameLabel!)
        constrainInnerView(nameLabel!, to: containerView)
        nameLabel?.isUserInteractionEnabled = true
        nameLabel?.text = item?.name
        let nameTappedRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(DetailVC.nameTapped(_:)))
        nameLabel?.addGestureRecognizer(nameTappedRecognizer)
    }

    func configureNoteLabel() {
        noteLabel = UILabel()
        noteLabel?.backgroundColor = .lightGray
        noteLabel?.font = UIFont.systemFont(ofSize: 24)
        noteLabel?.textAlignment = .center
        self.containerView.addSubview(noteLabel!)
        constrainInnerView(noteLabel!, to: containerView)
        noteLabel?.isUserInteractionEnabled = true
        noteLabel?.text = item?.note
        let noteTappedRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(DetailVC.noteTapped(_:)))
        noteLabel?.addGestureRecognizer(noteTappedRecognizer)
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

    func nameTapped(_ sender: UITapGestureRecognizer) {

        UIView.transition(with: containerView,
                          duration: 0.5,
                          options: [UIViewAnimationOptions.transitionCurlUp],
                          animations: {
                            self.nameLabel?.removeFromSuperview()
                            self.configureNoteLabel()
        },
                          completion: nil
        )
    }

    func noteTapped(_ sender: UITapGestureRecognizer) {

        UIView.transition(with: containerView,
                          duration: 0.5,
                          options: [UIViewAnimationOptions.transitionCurlDown],
                          animations: {
                            self.noteLabel?.removeFromSuperview()
                            self.configureNameLabel()
        },
                          completion: nil
        )
    }
}
