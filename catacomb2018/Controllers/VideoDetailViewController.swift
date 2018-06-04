import UIKit
import WebKit

class VideoDetailViewController: UIViewController, WKUIDelegate{
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var labSource: UITextView!
    @IBOutlet weak var labInfo: UITextView!
    
    var video: Video!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        if !Util.isConnectedToNetwork() {
            let alert = UIAlertController(title: "Catacombes", message: "Please connect to internet for video", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        if let tmp = video {
            print(tmp.url!)
            let code = tmp.code.replacingOccurrences(of: "<iframe",
                                                     with: "<iframe width=\"100%\"  height=\"100%\" ")
            //height=\"\(containerView.frame.size.height)\"
            webView.loadHTMLString(code, baseURL: URL(string: tmp.url!)!)
            
            labSource.text = video.url
            labInfo.text = video.info
            
            navigationBar.topItem?.title = video.title
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
