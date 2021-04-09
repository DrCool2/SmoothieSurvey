module ApplicationHelper


#helper_method :authentication

def authentication(username,password)

  a_domain = "@fsdbk12.org"
  a_loginid = username
  a_loginid_full = a_loginid + a_domain

  a_password = password
  a_group = "TEST-grp-smoothie"
  a_group_full = "CN=" + a_group + ",OU=Staff Accounts,OU=User Accounts,DC=fsdbk12,DC=org"
  member = Array.new
  group_found_results = Array.new

  if a_loginid.nil?
    puts "ERROR - No Username Given!!"
    exit
  end

  server = {
   :host => 'fsdbdc05.fsdbk12.org',
   :base => 'ou=Staff Accounts,ou=User Accounts,dc=fsdbk12,dc=org',
   :port => 636,
   :encryption => :simple_tls,
   :auth => {
    :method => :simple,
    :username => a_loginid_full,
    :password => a_password
   }
  }

  conn = Net::LDAP.new(server)
  if conn.bind
   puts "CONNECTED!"
   authenticated = true
  else
   puts "Authentication FAILED!"
   authenticated = false 
   return false
  end

  results = conn.search(:filter => Net::LDAP::Filter.eq("sAMAccountName", a_loginid))

    if results.count == 1 && results[0].attribute_names.include?(:memberof) && results[0].memberof.include?(a_group_full)
	  puts "GROUP FOUND"
	  authorized = true
    else
	  puts "group NOT found - Authorization FAILED!"
	  authorized = false
	  return false
    end

    if authenticated == true && authorized == true
	@first_name = results[0].cn
	@last_name = results[0].sn
	@username = a_loginid
	return true
    else
	return false
    end
  end
end
