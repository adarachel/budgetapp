require 'rails_helper'

RSpec.describe Expense, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Paulina', email: 'paulina@gmail.com', password: '123456')
    @expense = Expense.create(name: 'Gym', amount: 400, user: @user)
    @group = Group.create(name: 'Health', icon: 'hospital.png', user: @user)
    @group_expense = GroupExpense.create(group: @group, expense: @expense)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      get group_path(@group.id)
    end

    it 'render exact text on page' do
      expect(response.body).to include('Gym')
    end
  end
end
