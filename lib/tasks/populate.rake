# encoding: utf-8

namespace :db do
  desc "Erase and fill database"
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    # Invoke rake db:migrate just in case...
    Rake::Task['db:migrate'].invoke

    print "Step  0: Clearing old data"
    [AccountType].each(&:delete_all)
    puts "...done!"

    #Add an account type
    type = AccountType.new
    type.name = "Facebook"
    type.permissions = ["Memorialize"]
    type.content = "<a href='https://www.facebook.com/help/contact/305593649477238'>Memorialization info</a><p>Memorialization of account upon request and proof of death. This helps protect the deceased’s privacy</p>"
    type.save!

    type = AccountType.new
    type.name = "Twitter"
    type.permissions = ["Archive"]
    type.content = "Must be a verified family member or authorized to act on behalf of the estate."
    type.save!

    type = AccountType.new
    type.name = "Google"
    type.permissions = ["Archive", "Transfer Ownership"]
    type.content = "Specify what to do with your account through <a href='https://support.google.com/accounts/answer/3036546?hl=en'>Inactive Account Manager</a>."
    type.save!
    
    type = AccountType.new
    type.name = "Instagram"
    type.permissions = ["Delete"]
    type.content = "Report a Deceased Person's Account: <a href='https://www.facebook.com/help/instagram/contact/396019703850735'>form</a>"
    type.save!    
    
    type = AccountType.new
    type.name = "Yahoo"
    type.permissions = ["None"]
    type.content = "<ul><li>After death, individual loses all ownership rights.</li><li>By court order or subpoena only.</li>"
    type.save!    

    type = AccountType.new
    type.name = "Flickr"
    type.permissions = ["Archive"]
    type.content = "Contact Yahoo! Legal Compliance team: 408-349-3687<br>Include:<ul><li>Death Certificate</li><li>URL</li><li>Screen Name</li></ul>"
    type.save!
    
    type = AccountType.new
    type.name = "America Online"
    type.permissions = ["Transfer"]
    type.content = "Transer to another AOL username already listed on the account. <br> Contact: <a href='http://help.aol.com/help/microsites/microsite.do?cmd=displayKC&docType=kc&externalId=217480'>AOL Customer Service</a>"
    type.save!
    
    type = AccountType.new
    type.name = "Pinterest"
    type.permissions = ["None"]
    type.content = "Deactivate: <ul><li>Profile will be unavailable.</li><li>Unlink from Facebook and Twitter</li></ul>"
    type.save!
    
    type = AccountType.new
    type.name = "eBay"
    type.permissions = ["None"]
    type.content = "Deactivate your own account."
    type.save!
    
    type = AccountType.new
    type.name = "LinkedIn"
    type.permissions = ["None"]
    type.content = "Fill out <a href='https://www.docusign.net/MEMBER/PowerFormSigning.aspx?PowerFormId=91e28b6c-bc93-47ed-8d1e-1f81083529d6'>form</a>.<br>Include:<ul><li>Memeber's Name</li><li>Company they worked at most recently</li><li>Your relation to the member</li><li>Link to the member profile</li><li>Member's email address</li></ul>"
    type.save!
    
    type = AccountType.new
    type.name = "deviantArt"
    type.permissions = ["Memorialize"]
    type.content = "Deviant Cemetery:<br>Include:<ul><li>Username</li><li>Age</li><li>Date of death</li><li>Cause of death</li><li>Proof of death</li></ul>"
    type.save!
    
    type = AccountType.new
    type.name = "MySpace"
    type.permissions = ["Delete", "Archive", "Remove Content"]
    type.content = "Requires email to accountcare@support.myspace.com. <br> Include: <ol><li>obituary or death certificate </li><li>How you are related to the deceased</li><li>deceased user's Myspace friend ID</li><li>Request to either delete or preserve the profile, or to remove content.</li></ol>"
    type.save!
    
    type = AccountType.new
    type.name = "Microsoft Network"
    type.permissions = ["None"]
    type.content = "Cannot delete account."
    type.save!
    
    type = AccountType.new
    type.name = "eHarmony"
    type.permissions = ["Archive"]
    type.content = "Must be logged in to cancel an account. Or, call customer service"
    type.save!
    
    type = AccountType.new
    type.name = "Match.com"
    type.permissions = ["Archive"]
    type.content = "Must be logged in to cancel an account. Or, call customer service"
    type.save!

    type = AccountType.new
    type.name = "Yelp"
    type.permissions = ["Archive"]
    type.content = "Must be logged in to cancel an account. Or, call customer service"
    type.save!

    type = AccountType.new
    type.name = "Friendster"
    type.permissions = ["Archive"]
    type.content = "Archive account instructions: <br> Include: <ol><li>Log into account</li><li>Go to 'Account Settings'</li><li>Click on 'Deactivate'</li><li>Enter account password</li><li>Click on 'Continue deactivating my account'</li></ol>"
    type.save!

    type = AccountType.new
    type.name = "Apple"
    type.permissions = ["Delete"]
    type.content = "Delete account instructions: <ol><li>Go to 'Settings' on your device</li><li>Touch the iCloud button and scroll to the bottom of the screen</li><li>Click on 'Delete Account'."
    type.save!

    type = AccountType.new
    type.name = "AT&T"
    type.permissions = ["Archive", "Alter"]
    type.content = "Call Customer Service: 1800-331-0500 or 611 <br>Provide:<ol><li>Account holder’s Social Security</li><li>Account password</li></ol>"
    type.save!

    type = AccountType.new
    type.name = "Verizon"
    type.permissions = ["Archive"]
    type.content = "Call: 1-800-VERIZON (1-800-837-4966)"
    type.save!

    type = AccountType.new
    type.name = "Tmobile"
    type.permissions = ["Archive"]
    type.content = "Call: 1-877-453-1304 or 611. <br> Provide: <ol><li>Mobile number</li><li>Account number</li><li>Billing responsible party name</li><li>Death certificate, or attorney/legal estate documents if death certificate is not yet available</li></ol>"
    type.save!

    type = AccountType.new
    type.name = "Sprint"
    type.permissions = ["Archive"]
    type.content = "Email: DeceasedNotification@sprint.com <br> Provide: <ol><li>Account holder's name</li><li>Phone number</li><li>Date of death</li><li>Last 4 digits of Social Security number</li><li>Your name and phone number</li><li>A death certificate, obituary, funeral card, probate letter, or a legal document from an attorney or a court</li></ol>"
    type.save!

    type = AccountType.new
    type.name = "Wordpress"
    type.permissions = ["None"]
    type.content = "Cannot delete account but can delete blogs."
    type.save!

    type = AccountType.new
    type.name = "Webmd"
    type.permissions = ["Archive", "Delete"]
    type.content = "Delete Account: email webmdcommunity@webmd.net. <br>Provide:<ol><li>Email</li><li>Member Name</li><li>Reason: Safety or Privacy.</li></ol>"
    type.save!
    
    type = AccountType.new
    type.name = "Ask.com"
    type.permissions = ["Delete"]
    type.content = "Delete Account: <ol><li>Click 'Settings'</li><li>Click 'My Account'</li><li>Click 'Delete My Account'</li></ol>"
    type.save!
    
    puts ".... done!"

  end
end
