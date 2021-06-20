require "csv"

class ImportCsv
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import_prefecture(path)
    CSV.foreach(path, headers: true) do |p|
      Prefecture.create!(
        prefecture_name: p["prefecture_name"]
      )
    end
  end

  def self.import_spot(path)
    CSV.foreach(path, headers: true) do |s|
      Spot.create!(
        spot_name: s["spot_name"],
        content: s["content"],
        photo: s["photo"],
        prefecture_id: s["prefecture_id"]
      )
    end
  end
end
