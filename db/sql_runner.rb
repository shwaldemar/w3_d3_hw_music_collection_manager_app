require('pg')

class SqlRunner

  def self.run(sql, values = []) #=[] passes an empty array ("Default parameter") if nothing gets passed. If I didn't give you a value I need to run it anyway. N.B. Must put default values at the end!!! If you put it at the start it will skip the other.
    begin
      db = PG.connect({
        dbname: "music_manager",
        host: "localhost"
        })
        db.prepare("query", sql)
        result =
        db.exec_prepared("query", values)
      ensure
        db.close() if db != nil
    end
      return result
  end
end
