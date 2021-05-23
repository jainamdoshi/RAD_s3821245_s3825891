require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  def setup
    @newsletter = Newsletter.new(email: "customer@myapp.com")
  end
  
  test "should be valid" do
    assert @newsletter.valid?
  end
end
