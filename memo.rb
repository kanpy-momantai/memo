require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます
loop{
  puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
  memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
  if memo_type == 1 || memo_type == 2
    # if文を使用して続きを作成していきましょう。
    # 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
    if memo_type == 1 then
        puts "拡張子を除いたファイル名を入力してください"
        memo_name = gets.chomp
        memo_name += '.csv'
        puts "メモしたい内容を入力してください"
        puts "Ctrl+Dで入力を終了します"
        input = readlines
        CSV.open(memo_name,'w') do |csv|
          csv << input
        end
        puts "メモを保存しました"
    elsif memo_type == 2
        puts "編集したい拡張子を除いたファイル名を入力してください"
        memo_name = gets.chomp
        memo_name += '.csv'
        if File.exist?(memo_name)
          puts "編集するメモの内容を入力してください"
          puts "Ctrl+Dで入力を終了します"
          input = readlines
          CSV.open(memo_name,'a') do |csv|
            csv << input
          end
        else
          puts "指定されたファイルは見つかりません"
        end
    end
    break
  end
}
