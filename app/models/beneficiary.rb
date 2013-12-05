class Beneficiary < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :last_name, :phone, :relationship, :state, :street, :zip, :user_id

  has_many :account_beneficiaries, dependent: :destroy
  has_many :accounts, through: :account_beneficiaries
  belongs_to :user

  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :first_name, :last_name, :email, :phone
  # if zip included, it must be 5 digits only
  validates_format_of :zip, :with => /^\d{5}$/, :message => "should be five digits long", :allow_blank => true
  # phone can have dashes, spaces, dots and parens, but must be 10 digits
  validates_format_of :phone, :with => /^(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})$/, :message => "should be 10 digits (area code needed) and delimited with dashes only"
  # email format (other regex for email exist; doesn't allow .museum, .aero, etc.)
  # Not allowing for .uk, .ca, etc. because this is a Pittsburgh business and customers not likely to be out-of-country
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format"
  # if state is given, must be one of the choices given (no hacking this field)
  validates_inclusion_of :state, :in => User::STATES_LIST.values, :message => "is not an option", :allow_nil => true, :allow_blank => true
  # if not limited to the three states, it might be better (but slightly slower) to write:
  # validates_inclusion_of :state, :in => STATES_LIST.map {|key, value| value}, :message => "is not an option", :allow_nil => true, :allow_blank => true
   
  # a method to get owner name in last, first format
  def name
    last_name + ", " + first_name
  end
  
  # a method to get owner name in last, first format
  def proper_name
    first_name + " " + last_name
  end
  
  
  # Callback code
  # -----------------------------
   private
     # We need to strip non-digits before saving to db
     def reformat_phone
       phone = self.phone.to_s  # change to string in case input as all numbers 
       phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.phone = phone       # reset self.phone to new string
     end

end
