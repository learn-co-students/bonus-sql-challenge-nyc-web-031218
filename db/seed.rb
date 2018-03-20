# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
filename = 'daily_show_guests.csv'
file = File.open(filename, 'r')

file.each_line("\n"){ |row|
  columns = row.strip.split(",")

sql = <<-SQL
  INSERT INTO daily_show_guests (year, googleknowlege_cccupation, show_date, category, name)
  VALUES (?, ?, ?, ?, ?);
  SQL
year = columns[0]
googleknowlege_cccupation = columns[1]
show_date = columns[2]
category = columns[3]
name = columns[4]
if year != "YEAR"
DB[:conn].execute(sql, year, googleknowlege_cccupation, show_date, category, name)
end
}
