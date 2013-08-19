Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie_details|
    Movie.create(movie_details)
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie_title, director|
  Movie.find_by_title(movie_title).director.should == director
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  (page.body =~ /#{e1}/).should < (page.body =~ /#{e2}/)
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.scan(/[a-zA-Z0-9a\-]+/).each do |rating|
    step %{I #{uncheck}check "ratings_#{rating}"}
  end
end

Then /I should see all of the movies/ do 
  all("table#movies tr").count.should == 11
end
