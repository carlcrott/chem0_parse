# firing up EC2 

# all knife commands follow the format:
knife sub-command [ARGUMENTS] (options)


all machines run chef-client ... and the primary runs chef-server




Pulled From:
# http://www.themomorohoax.com/2010/07/31/ruby-chef-tutorial

# video
http://blip.tv/opscode/getting-started-with-chef-on-the-opscode-platform-3879817
# text
http://wiki.opscode.com/display/chef/Fast+Start+Guide








Knife = Chef command line tool
Shef is to Chef  as script/console is to rails


# fire up server on Linode/Rackspace/Slicehost
$ gem install net-ssh-multi
$ knife bootstrap 172.x.x.x  # try to login to the given IP as root

# bootstrap will now setup chef-client on the instantiated server
# and if you followed the "getting started" guide it will upload the SSH keys


# login to the server via SSH

$ chef-client  # connects to main server + runs recipies


# havnt created recipies yet .. so nada!


# make a Role in:
# /roles/base.json
                                # Fill these in:
  {
    "name": "base",
    "default_attributes": {
      "chef": {
        "server_url": "https://api.opscode.com/organizations/#{YOUR COMPANY!}",
        "cache_path": "/var/chef/cache",
        "backup_path": "/var/chef/backup",
        "validation_client_name": "#{YOUR COMPANY!}-validator",
        "run_path": "/var/chef"
      }
    },
    "json_class": "Chef::Role",
    "run_list": [
      "recipe[ubuntu::default]",
      "recipe[build-essential::default]",
      "recipe[openssl::default]",
      "recipe[chef::client]",
      "recipe[chef::delete_validation]",
      "recipe[git::default]"
    ],
    "description": "Basic Server",
    "chef_type": "role",
    "override_attributes": {
    }
  }


# upload role >>> chef server
$ knife role from file roles/base.json


# download the cookbooks from the run_list array, this downloads to the chef-repo + makes git commit
$ knife cookbook site vendor ubuntu
$ knife cookbook site vendor build-essential
$ knife cookbook site vendor openssl
$ knife cookbook site vendor chef
$ knife cookbook site vendor git


#upload
knife cookbook upload -a    # uploads chef cookbooks with knife
# OR
rake upload_cookbooks



# (remote) should list all the commands
$ knife

# run chef-client on the node
$ chef-client


# If it does run cleanly: Congratulations! You’re cooking with Chef. Ohai!










