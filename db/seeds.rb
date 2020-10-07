require 'csv'

Lender.destroy_all
Mortgage.destroy_all

puts "START -- #{Time.now}"
puts '--------------------'
puts 'Creating lenders'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = File.dirname(__FILE__) + '/../db/mortgages.csv'

CSV.foreach(filepath, csv_options) do |row|
  # Here, row is an array of columns
  Lender.where(name: row[0]).first_or_create
  lender = Lender.find_by(name: row[0])
  Mortgage.create!(lender: lender, duration: row[1], ltv: row[2].to_f, interest: row[3].to_f)
end

puts "+ #{Lender.count} lenders created"
puts "+ #{Mortgage.count} mortgages created"
puts '--------------------'
puts "END -- #{Time.now}"
