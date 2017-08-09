class UsersController < ApplicationController
  def downgrade
    current_user.standard!
    private_wikis = current_user.wikis.where(private: true)
    private_wikis.each do |wiki|
      wiki.update(private: false)
    end
    flash[:notice] = "You have been cancelled, #{current_user.email}."
    redirect_to edit_user_registration_path(current_user)
  end
end
