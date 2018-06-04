import UIKit

class PlanViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tilingView: TilingViewForImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 6310, height: 6310)
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = max(scaleWidth, scaleHeight)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1.2
        scrollView.zoomScale = 0.3
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
//        self.scrollView.contentOffset = CGPoint(x: 300, y: 300)
        self.scrollView.contentSize = CGSize(width: 1893, height: 1893)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView ) ->  UIView? {
        return self.tilingView
    }
}

