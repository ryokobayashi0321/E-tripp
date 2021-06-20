require "csv"

class ImportCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    CSV.foreach(path, headers: true) do |row|
      Spot.create!(
        spot_name: row["spot_name"],
        content: row["content"],
        photo: row["photo"]
      )
    end
  end
end
