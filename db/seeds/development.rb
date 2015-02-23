user = User.where(email: 'worldnamer@worldnamer.com').first_or_initialize
user.password = 'development'
user.password_confirmation = 'development'
user.save!