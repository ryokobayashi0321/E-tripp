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
end
