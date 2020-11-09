require 'rails_helper'

RSpec.describe 'I visit a Doctor show page' do
  before :each do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @doc1 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")

  end
  it "I see the doctor's name, specialty, and university where they got their doctorate.  Also I see the name of the hospital they work in  and names of all the doctor's patients" do
    visit '/doctors/:id'

    expect(current_path).to eq("/doctors/#{@doc1.id}")
  end
end
