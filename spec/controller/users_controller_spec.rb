require 'rails_helper'
describe  UsersController, type: :controller do 

	before(:each) do
    sign_in(current_user)
  end

	describe '#index' do
	let!(:current_user) {create :user} 
			subject { get :index }
		
		it 'return all users' do		
			subject
			expect(assigns(:users)).to eq(User.all)
		end
		# it " " do 
		# 	subject
		# 	expect(response).to render_template(:index)
			
		# end
	end


end 