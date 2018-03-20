# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
 sql = <<-SQL
 SELECT name FROM daily_show_guests
 GROUP BY name
 ORDER BY COUNT(name) DESC LIMIT 1
 SQL
 DB[:conn].execute(sql)
end

def most_popular_profession_per_year
  sql = <<-SQL
  SELECT year, googleknowlege_cccupation FROM daily_show_guests
  Where googleknowlege_cccupation = (SELECT googleknowlege_cccupation FROM daily_show_guests
  GROUP BY googleknowlege_cccupation
  ORDER BY COUNT(googleknowlege_cccupation) DESC LIMIT 1)
  GROUP BY year
  ORDER BY year DESC
  SQL
  DB[:conn].execute(sql)
end

def most_popular_profession
  sql = <<-SQL
  SELECT googleknowlege_cccupation FROM daily_show_guests
  GROUP BY googleknowlege_cccupation
  ORDER BY COUNT(googleknowlege_cccupation) DESC LIMIT 1
  SQL
  DB[:conn].execute(sql)
end

def count_first_name_bill
  sql = <<-SQL
  SELECT count(name) FROM daily_show_guests
  WHERE name like "%Bill%"
  SQL
  DB[:conn].execute(sql)
end

def patrick_stewart_dates
  sql = <<-SQL
  SELECT show_date FROM daily_show_guests
  WHERE name = "Patrick Stewart"
  SQL
  DB[:conn].execute(sql)
end

def year_most_guests
  sql = <<-SQL
  SELECT year, count(year) FROM daily_show_guests
  group by year
  ORDER BY count(year) DESC LIMIT 1
  SQL
  DB[:conn].execute(sql)
end

def most_popular_category_per_year
  sql = <<-SQL
  SELECT year, category FROM daily_show_guests
  Where category = (SELECT category FROM daily_show_guests
  GROUP BY category
  ORDER BY COUNT(category) DESC LIMIT 1)
  GROUP BY year
  ORDER BY year DESC
  SQL
  DB[:conn].execute(sql)
end
