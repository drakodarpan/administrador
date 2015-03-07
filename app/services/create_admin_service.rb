class CreateAdminService
  def call
    usuario = Usuario.find_or_create_by!(:email => Rails.application.secrets.admin_email) do |usuarios|
        usuarios.name = Rails.application.secrets.admin_name
        usuarios.apellido = Rails.application.secrets.admin_apellido
        usuarios.password = Rails.application.secrets.admin_password
        usuarios.password_confirmation = Rails.application.secrets.admin_password
    end
  end
end
