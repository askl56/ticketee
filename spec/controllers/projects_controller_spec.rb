require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  context "standard users" do

    before do
      sign_in(user)
    end

    it "displays an error for a missing project" do
      get :show, id: "not-here"

      expect(response).to redirect_to(projects_path)
      message = "The project you were looking for could not be found."

      expect(flash[:alert]).to eql(message)
    end

    context "standard users" do
      {
        new: :get,
        create: :post,
        edit: :get,
        update: :put,
        destroy: :delete
      }.each do |action, method|

        it "cannot access the #{action} action" do
          sign_in(user)

          send(method, action, :id => FactoryGirl.create(:project))

          expect(response).to redirect_to(root_path)
          expect(flash[:alert]).to eql("You must be an admin to do that.")
        end
      end
    end
  end
end
