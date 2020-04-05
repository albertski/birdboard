def submit_form(form_selector)
  form = find("form#{form_selector}")
  Capybara::RackTest::Form.new(page.driver, form.native).submit({})
end
