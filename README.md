# iOS How to copy epub files from your app to iBooks app

![alt tag](https://raw.github.com/maximbilan/iOS-Document-Iteraction/master/img/img1.png)

<i>Apple</i> provides this possibility via class <i><a href="https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDocumentInteractionController_class/index.html">UIDocumentInteractionController</a></i>. It’s really simple to do. I’ll just keep here.

Example:

<pre>
var controller = UIDocumentInteractionController()

let epubURL = NSBundle.mainBundle().URLForResource("test", withExtension: "epub")
controller.URL = epubURL
if !controller.presentOpenInMenuFromRect(button.bounds, inView: view, animated: true) {
  print("You don't have an app installed that can handle ePub files.")
}
</pre>

![alt tag](https://raw.github.com/maximbilan/iOS-Document-Iteraction/master/img/img2.png)

Class <i><a href="https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDocumentInteractionController_class/index.html">UIDocumentInteractionController</a></i> has other features, you can read about in <i>Apple</i> documentation more details.
