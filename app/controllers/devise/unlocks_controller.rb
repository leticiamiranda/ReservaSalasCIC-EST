class Devise::UnlocksController < DeviseController
  skip_authorization_check
  def new
    super
  end

  def create
    super
  end

  def show
    super
  end

  protected

  def after_sending_unlock_instructions_path_for(resource)
    super(resource)
  end

  # The path used after unlocking the resource
  # def after_unlock_path_for(resource)
  #   super(resource)
  # end
end
