import Foundation
class News: NSObject
{
    var id: Int!
    var image: String!
    var title: String!
    var info: String!
    var url: String!
    
    override init() {
    }
    
    init(id:Int, title:String, url:String) {
        self.id = id
        self.title = title
        self.url = url
    }
    
    func getList() -> [News]! {
        var result = [News]()
        let sql = "select * from News"
        
        let db = BDD.instance.database!
        do {
            if db.open() {
                var tmp : News
                let results = try db.executeQuery(sql, values: nil)
                while results.next() {
                    tmp = News()
                    tmp.id = Int(results.int(forColumn: "NID"))
                    tmp.image = results.string(forColumn: "Image") ?? ""
                    tmp.title = results.string(forColumn: "Title") ?? ""
                    tmp.info = results.string(forColumn: "Info") ?? ""
                    tmp.url = results.string(forColumn: "URL") ?? ""
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
