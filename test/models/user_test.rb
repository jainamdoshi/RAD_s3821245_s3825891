require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "customer@myapp.com", name: "Test User")
  end
  
  test "should not be valid" do
    assert_not @user.valid?
  end
  
  test "name should be present" do
    @user.email = " "
    assert_not @user.valid?
  end
  
  test "password should not be too long" do
    @user.password = "x" * 26
    @user.password_confirmation = "x" * 26
    assert_not @user.valid?
  end
  
  test "password should not be too short" do
    @user.password = "x" * 6
    @user.password_confirmation = "x" * 6
    assert_not @user.valid?
  end
  
  test "password and password confirmation should match" do
    @user.password = "a" * 9
    @user.password_confirmation = "x" * 9
    assert_not @user.valid?
  end
  
  test "good emails should pass" do
    valid_emails = %w[joe@apple.com TEST@EXP.ORG joe_s@a-School.net alex.smith@topshop.biz don+z@136.co]
    valid_emails.each do |email|
      @user.password = "x" * 8
      @user.password_confirmation = "x" * 8
      @user.email = email
      assert @user.valid?, "#{email.inspect} should be valid"
    end
  end
  
  test "bad emails should be rejected" do
    invalid_emails = %w[joe@apple,com TEST@@EXP.ORG joe_s@a_School.net
    alex.smith@top shop.biz don+z@13+6.co]
    invalid_emails.each do | email |
      @user.password = "x" * 8
      @user.password_confirmation = "x" * 8
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end
  
  test "Password should not have special characters" do
    valid_passwords = %w[1sdf321/5sdf165 sdfa&dfadsf sfasdf@htjtgvr "dafsdf dfasdf" jdafja,6454 dsfasf.griejf dafewf&dsfas agff#dfasdf @^&&*$^#%)(%+^) $$$$$$$$$$$$$ !!!!!!!!!!! :{}sdfafasdfaf:" %%%%%%%%%%%%%%%%%%%%%%%%]
    valid_passwords.each do |password|
      @user.password = password
      @user.password_confirmation = password
      assert_not @user.valid?, "#{password.inspect} should not be valid"
    end
  end
  
  test "Password should be valid" do
    valid_passwords = ["12345678", "sdfjlsdfjasf", "14641654651", "iangkujvrge"]
    valid_passwords.each do |password|
      @user.password = password
      @user.password_confirmation = password
      assert @user.valid?, "#{password.inspect} should be valid"
    end
  end
  
  test "email addresses should be unique" do
    @user.password = "x" * 8
    @user.password_confirmation = "x" * 8
    clone = @user.dup
    clone.email = @user.email.upcase
    @user.save
    assert_not clone.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    @user.password = "x" * 8
    @user.password_confirmation = "x" * 8
    mixed_case_email = "Joe@RAd.oRg.AU"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
end
