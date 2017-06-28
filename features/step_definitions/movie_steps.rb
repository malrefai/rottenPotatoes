Given /^I am on the rottenPotatoes home page$/ do
  visit movies_path
end


When /^I have added a movie with title "(.*?)" and rating "(.*?)"$/ do |title, rating|
  visit new_movie_path
  fill_in 'Title', :with => title
  select rating, :from => 'Rating'
  click_button 'Save Changes'
end

Then /^I should see a movie list entry with title "(.*?)" and rating "(.*?)"$/ do |title, rating|
  result=false
  all("tr").each do |tr|
    if tr.has_content?(title) && tr.has_content?(rating)
      result = true
      break
    end
  end
  expect(result).to be_truthy
end

When /^I have visited the Details about "(.*?)" page$/ do |title|
  visit movies_path
  click_on "More about #{title}"
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  expect(page).to have_content(text)
end
When /^I have edited the movie "(.*?)" to change the rating to "(.*?)"$/ do |movie, rating|
  click_on "Edit"
  select rating, :from => 'Rating'
  click_button 'Update Movie Info'
end
When /^I have attempted to add a non\-existent movie "(.*?)" from TMDb$/ do |movie|
  fill_in 'Search Terms', :with => movie
  click_on 'Search TMDb'
end

Then /^I should see "(.*?)" was not found in TMDb\."$/ do |movie|
  str = "'#{movie}' was not found in TMDb."
  expect(page).to have_content(str)
end