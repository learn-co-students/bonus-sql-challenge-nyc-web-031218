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
  select distinct year, googleknowledge_occupation, max(popular_profession)
  from (
      select year, googleknowledge_occupation, count(googleknowledge_occupation) popular_profession
      from daily_show_guests
      group by googleknowledge_occupation, year
      order by year desc, popular_profession desc
  )
  group by year
  order by year desc, popular_profession desc;
  SQL
  DB[:conn].execute(sql)
end

def most_popular_profession
  sql = <<-SQL
  SELECT googleknowledge_occupation FROM daily_show_guests
  GROUP BY googleknowledge_occupation
  ORDER BY COUNT(googleknowledge_occupation) DESC LIMIT 1
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
         select distinct year, category, max(popular_profession)
         from (
             select year, category, count(category) popular_profession
             from daily_show_guests
             group by category, year
             order by year desc, popular_profession desc
         )
         group by year
         order by year desc, popular_profession desc;
         -- >>>> USE THE QUERY BELOW FOR A SINGLE YEAR <<<<<
        --  select year, category, count(category)
        -- from daily_show_guests
        --  where year = 2001
        --  group by category
        --  order by count(category) desc limit 1;
  SQL
  DB[:conn].execute(sql)
end
