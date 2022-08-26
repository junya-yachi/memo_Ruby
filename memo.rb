require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  
  puts "メモしたい内容を記入してください"
  puts "完了したらCtrl + Dを押してください"
  memo_input = STDIN.read.chomp
  
  CSV.open("#{file_name}.csv", "a") do |csv|
  csv << ["#{memo_input}"]
  end
elsif memo_type == 2
  puts "編集したいファイル名を拡張子を除いて入力してください"
  file_name = gets.chomp

  begin
    CSV.open("#{file_name}.csv", "r+") do |csv|
    puts "メモしたい内容を記入してください"
    memo_input = STDIN.read.chomp
    csv << ["#{memo_input}"]
    end
  rescue
    puts"入力された名前のファイルは存在しません"
  end

else 
  puts "その入力は受付されていません"
end