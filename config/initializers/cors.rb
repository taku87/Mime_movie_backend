Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', 'http://localhost:3001', 'https://mime-movie.com', 'https://api.mime-movie.com'

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true,
      expose: ['Per-Page', 'Total', 'Link', 'X-CSRF-Token']
  end
end