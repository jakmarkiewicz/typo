Given /the following articles exist/ do |contents_table|
  contents_table.hashes.each do |article|
  	Article.create!(article)
  end
end

And /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

And /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create(comment)
  end
end

Given /^I am logged into the admin panel as "(.*)"$/ do |login|
  visit '/accounts/login'
  fill_in 'user_login', :with => login
  fill_in 'user_password', :with => login + "pw"
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

When /^I visit the edit page for "(.*)"$/ do |title|
  visit 'admin/content/edit/' + Article.find_by_title(title).id.to_s
end