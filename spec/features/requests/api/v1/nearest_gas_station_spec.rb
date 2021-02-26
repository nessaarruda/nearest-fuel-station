require 'rails_helper'

describe 'API requests' do
  describe 'As a user when I visit the root path' do
    describe 'happy path' do
      it 'Can search nearest station for electrict fuel' do
        visit root_path

        select 'Turing', from: :location

        click_button 'Find Nearest Station'

        expect(current_path).to eq(search_path)
        expect(page).to have_css('.access_times')
        expect(page).to have_css('.distance') # float in miles
        expect(page).to have_content('Distance to station is 0.1 miles')
        # expect(page).to have_css('.travel_time') # string and should be 1 min
        # # expect(page).to have_content('Travel time is 1 min')
        # expect(page).to have_css('.directions')
        # expect(page).to have_content('Turn left onto Lawrence St.')
      end
    end
  end
end
