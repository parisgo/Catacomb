import UIKit
import WebKit

class NewsDetailViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var labInfo: UITextView!
    
    @IBOutlet weak var labUrl: UITextView!
    var news: News!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.topItem?.title = news.title
        
        let destinationPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        let regImages = news.info.getByRegex(regex: "#[a-zA-Z_\\-0-9.]*#")
        for tmpReg in regImages {
            let tmpImg = tmpReg.replacingOccurrences(of: "#", with: "")
            let tmpImgLocation = "file://\(destinationPath)/\(tmpImg)"
            news.info = news.info.replacingOccurrences(of: tmpReg, with: tmpImgLocation)
            copyImage(image: tmpImg)
        }
        
        labInfo.attributedText = news.info.html2AttributedString
        labUrl.text = news.url
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func copyImage(image: String) {
        if let resourceMainURL = Bundle.main.resourceURL{
            let destinationPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
            let destURL = URL(fileURLWithPath: destinationPath)
            
            do {
                let fileManager = FileManager.default
                if !FileManager.default.fileExists(atPath: destURL.appendingPathComponent(image).path) {
                    try fileManager.copyItem(at: resourceMainURL.appendingPathComponent(image),
                                             to: destURL.appendingPathComponent(image))
                }
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
}
