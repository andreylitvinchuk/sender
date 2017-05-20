json.extract! newsletter, :id, :text, :filters, :start_at, :created_at, :updated_at
json.url newsletter_url(newsletter, format: :json)
