name             "myapp_db"
maintainer       "John Doe"
maintainer_email "nobody@in-the-house.com"
license          "Apache 2.0"
description      "Handles database operation for my precious app"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1"

supports "debian"
supports "ubuntu"

depends "database"