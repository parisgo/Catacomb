import Foundation
class Video: NSObject
{
    var id: Int!
    var image: String!
    var title: String!
    var info: String!
    var url: String!
    var code: String!
    
    override init() {
    }
    
    init(id:Int, title:String, url:String) {
        self.id = id
        self.title = title
        self.url = url
    }
    
    func getList() -> [Video]! {
        var result = [Video]()
        let sql = "select * from Video"
        
        let db = BDD.instance.database!
        do {
            if db.open() {
                var tmp : Video
                let results = try db.executeQuery(sql, values: nil)
                while results.next() {
                    tmp = Video()
                    tmp.id = Int(results.int(forColumn: "VID"))
                    tmp.image = results.string(forColumn: "Image") ?? ""
                    tmp.title = results.string(forColumn: "Title") ?? ""
                    tmp.info = results.string(forColumn: "Info") ?? ""
                    tmp.url = results.string(forColumn: "URL") ?? ""
                    tmp.code = results.string(forColumn: "Code") ?? ""
                    result.append(tmp)
                }
            }
        }
        catch{
            print(error.localizedDescription)
        }
        
        return result
    }
}
