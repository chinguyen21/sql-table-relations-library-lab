def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books WHERE series_id = 1 ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters ORDER BY LENGTH(motto) DESC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, count(*) FROM characters GROUP BY species ORDER BY count(*) DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT merge_table.name, subgenres.name FROM 
  (SELECT subgenre_id, name FROM authors 
  JOIN series ON authors.id = series.author_id) as merge_table 
  JOIN subgenres ON merge_table.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series JOIN
  (SELECT species, author_id FROM characters GROUP BY species HAVING species = 'human') as table_1
  ON series.id = table_1.author_id; "
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT name, count(*) FROM characters JOIN character_books 
  ON characters.id = character_books.character_id 
  GROUP BY character_id ORDER BY count(*) DESC, name ;"
end


#  SELECT name, count FROM characters JOIN
#   (SELECT character_id, count(*) as count FROM character_books GROUP BY character_id) as table_2
#   ON characters.id = table_2.character_id ORDER BY count DESC, name ;