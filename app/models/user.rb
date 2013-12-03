class User < ActiveRecord::Base
  attr_accessible :deceased, :dob, :email, :first_name, :last_name, :phone, :state, :street, :zip, :password, :password_confirmation
  
  has_secure_password

  has_many :accounts
  has_many :beneficiaries, through: :accounts

  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_confirmation_of :password
 
  scope :alphabetical, order('last_name, first_name')

  STATES_LIST = {'Alabama'=> 'AL','Alaska'=> 'AK','Arizona'=> 'AZ','Arkansas'=> 'AR','California'=> 'CA','Colorado'=> 'CO','Connectict'=> 'CT','Delaware'=> 'DE','District of Columbia '=> 'DC','Florida'=> 'FL','Georgia'=> 'GA','Hawaii'=> 'HI','Idaho'=> 'ID','Illinois'=> 'IL','Indiana'=> 'IN','Iowa'=> 'IA','Kansas'=> 'KS','Kentucky'=> 'KY','Louisiana'=> 'LA','Maine'=> 'ME','Maryland'=> 'MD','Massachusetts'=> 'MA','Michigan'=> 'MI','Minnesota'=> 'MN','Mississippi'=> 'MS','Missouri'=> 'MO','Montana'=> 'MT','Nebraska'=> 'NE','Nevada'=> 'NV','New Hampshire'=> 'NH','New Jersey'=> 'NJ','New Mexico'=> 'NM','New York'=> 'NY','North Carolina'=>'NC','North Dakota'=> 'ND','Ohio'=> 'OH','Oklahoma'=> 'OK','Oregon'=> 'OR','Pennsylvania'=> 'PA','Rhode Island'=> 'RI','South Carolina'=> 'SC','South Dakota'=> 'SD','Tennessee'=> 'TN','Texas'=> 'TX','Utah'=> 'UT','Vermont'=> 'VT','Virginia'=> 'VA','Washington'=> 'WA','West Virginia'=> 'WV','Wisconsin '=> 'WI','Wyoming'=> 'WY'}

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
  validates_inclusion_of :state, :in => STATES_LIST.values, :message => "is not an option", :allow_nil => true, :allow_blank => true
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
