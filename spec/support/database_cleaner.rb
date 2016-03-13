RSpec.configure do |config|

  # Tell RSpec not to manage transactions as Database Cleaner will handle it
  config.use_transactional_fixtures = false

  # Clear out the database completely before the test suite runs
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Perform database cleaning for each test example
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end
