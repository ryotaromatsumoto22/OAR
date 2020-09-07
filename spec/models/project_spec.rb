require 'rails_helper'

RSpec.describe Project, type: :model do
  context "データが正しく保存される" do
    before do
      @project = Project.new(user_id: 1)
      @project.name = "test0"
      @project.goal = "月100時間"
      @project.period = "2020-09-06 15:00:00"
      @project.end_of_period = "2021-09-06 15:00:00"
      @project.save
    end
    it "全て入力してあるので保存される" do
      expect(@project).to be_valid
    end
  end
end
