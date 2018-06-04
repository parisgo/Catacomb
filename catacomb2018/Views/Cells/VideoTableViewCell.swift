import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var labVideo: UILabel!
    @IBOutlet weak var imgVideo: UIImageView!
    
    var video: Video!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.labVideo.text = video?.title
        
        self.imgVideo.contentMode = UIViewContentMode.scaleAspectFit
        self.imgVideo.image = UIImage(named: video.image!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
