require 'rails_helper'

RSpec.describe ProjectDatum, type: :model do
  context "データが正しく保存される" do
    before do
      user = create(:user)
      project = create(:project)
      @project_datum = ProjectDatum.new
      @project_datum.user_id = user.id
      @project_datum.project_id = project.id
      @project_datum.hour = 1
      @project_datum.date = "2021-09-06"
      @project_datum.save
    end
    it "全て入力してあるので保存される" do
      expect(@project_datum).to be_valid
    end
  end
end