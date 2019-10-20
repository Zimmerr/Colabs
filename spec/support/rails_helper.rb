Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f  } # Add this at top of file


include SpecTestHelper # Add at bottom of file
