class UsersController < ApplicationController

  def downgrade
    current_user.update(role: "standard")
    current_user.wikis.update_all(private: false)
    flash[:notice] = "You have been cancelled, #{current_user.email}."
    redirect_to edit_user_registration_path(current_user)
  end
end
