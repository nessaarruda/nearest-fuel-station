require 'rails_helper'

=begin
As a user
When I visit "/"
And I select "Turing" form the start location drop down (Note: Use the existing search form)
And I click "Find Nearest Station"
Then I should be on page "/search"
Then I should see the closest electric fuel station to me.
For that station I should see
- Name
- Address
- Fuel Type
- Access Times
I should also see:
- the distance of the nearest station (should be 0.1 miles)
- the travel time from Turing to that fuel station (should be 1 min)
- The direction instructions to get to that fuel station
"Turn left onto Lawrence St Destination will be on the left"
=end
describe 'API requests' do
  describe 'As a user when I visit the root path' do
    describe 'happy path' do
      it 'Can search nearest station for electrict fuel' do
        visit root_path

        select 'Turing', from: :location

        click_button 'Find Nearest Station'

        expect(current_path).to eq(search_path)
        expect(page).to have_css('.name')
        expect(page).to have_css('.address')
        expect(page).to have_css('.fuel_type')
        expect(page).to have_css('.access_times')
        expect(page).to have_css('.distance_to_station') # float in miles
        expect(page).to have_content('Distance to station is 0.1 miles')
        expect(page).to have_css('.travel_time') # string and should be 1 min
        expect(page).to have_content('Your ETA is 1 min')
        expect(page).to have_css('.directions')
        expect(page).to have_content('Turn left onto Lawrence St Destination will be on the left')
      end
    end
  end
end
