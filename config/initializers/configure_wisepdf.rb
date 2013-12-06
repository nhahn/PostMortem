Wisepdf::Configuration.configure do |c|
  if Rails.env.staging? || Rails.env.production?
    c.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
  end
end
