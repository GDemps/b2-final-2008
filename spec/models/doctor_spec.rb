require 'rails_helper'

describe Doctor, type: :model do
  describe 'relationships' do
    it { should belong_to :hospital }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe "instance methods" do
    it "#total_doctors" do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @doc1 = @hospital.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
      @doc2 = @hospital.doctors.create!(name: "Grant Dempsey", specialty: "Cardio", university: "Auburn University")

      expect(@hospital.total_doctors).to eq(2)
    end
  end

end
