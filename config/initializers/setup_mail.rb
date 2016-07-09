ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
:address        => 'smtp.sendgrid.net',
:port          => '587',
:authentication     => :plain,
:user_name      => "app53362478@heroku.com",
:password       => "mcnacnyl7507",
:domain         => 'heroku.com',
:enable_starttls_auto => true
}
