require 'rails_helper'

RSpec.describe 'I visit a Hospital show page' do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doc1 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doc2 = @hospital.doctors.create!(name: "Grant Dempsey", specialty: "Cardio", university: "Auburn University")
    @doc3 = @hospital.doctors.create!(name: "John Doe", specialty: "General Surgery", university: "Harvard University")
    @doc4 = @hospital.doctors.create!(name: "Jane Smith", specialty: "Ortho", university: "Yale University")
  end

  it "Displays hospital name, number of doctors working here, and unique list of universities that this hospital's doctors attended" do
    visit "/hospitals/#{@hospital.id}"

    expect(page).to have_content(@hospital.name)
    expect(page).to have_content("Total Doctors: 4")
    expect(page).to have_content("Auburn University")
    expect(page).to have_content("Harvard University")
    expect(page).to have_content("Yale University")
  end
end
