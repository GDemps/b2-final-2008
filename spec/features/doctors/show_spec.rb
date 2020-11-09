require 'rails_helper'

RSpec.describe 'I visit a Doctor show page' do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doc1 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @patient1 = @doc1.patients.create!(name: "Katie Bryce", age: 24)
    @patient2 = @doc1.patients.create!(name: "Denny Duquette", age: 39)
    @patient3 = @doc1.patients.create!(name: "Rebecca Pope", age: 32)
  end

  it "I see the doctor's name, specialty, and university where they got their doctorate.  Also I see the name of the hospital they work in  and names of all the doctor's patients" do
    visit "/doctors/#{@doc1.id}"

    expect(current_path).to eq("/doctors/#{@doc1.id}")

    expect(page).to have_content(@doc1.name)
    expect(page).to have_content(@doc1.specialty)
    expect(page).to have_content(@doc1.university)
    expect(page).to have_content(@hospital.name)
    expect(page).to have_content(@patient1.name)
    expect(page).to have_content(@patient2.name)
    expect(page).to have_content(@patient3.name)
  end
  it "I can delete a patient from doctor" do
    visit "/doctors/#{@doc1.id}"

    within "#patient-#{@patient1.id}" do
      click_button "Remove Patient"
    end

    expect(current_path).to eq("/doctors/#{@doc1.id}")

    expect(page).to_not have_content(@patient1.id)
  end
end
