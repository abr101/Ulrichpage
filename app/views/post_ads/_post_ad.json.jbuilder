json.extract! post_ad, :id, :title, :description, :location, :phone, :keywords, :email, :get_response, :terms_privacy, :images, :created_at, :updated_at
json.url post_ad_url(post_ad, format: :json)
