feature 'name space' do
  scenario 'should be able to name my space' do
    visit '/spaces/new'
    fill_in("name", with: 'Blessing Apartment')
    fill_in("des", with: 'Beautiful three bed house')
    fill_in("price", with: 500)
    click_on 'List Space'
  expect(page).to have_content('Blessing Apartment')
  expect(page).to have_content('Beautiful three bed house')
  # expect(page).to have_content(500)
  end
end