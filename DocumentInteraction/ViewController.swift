//
//  ViewController.swift
//  DocumentInteraction
//
//  Created by Maxim on 3/28/16.
//  Copyright © 2016 Maxim Bilan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {

	private var documentInteractionController = UIDocumentInteractionController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		documentInteractionController.delegate = self
	}

	// MARK: - UIDocumentInteractionControllerDelegate
	
	func documentInteractionControllerViewControllerForPreview(controller: UIDocumentInteractionController) -> UIViewController {
		return self
	}

}

