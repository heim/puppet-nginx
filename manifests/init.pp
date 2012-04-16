class nginx {
  
  
  
  Exec["add-nginx-apt-repository"] -> Package["nginx"]  

  exec { "add-nginx-apt-repository":
    command => "add-apt-repository ppa:nginx/stable && apt-get update",
    require => Package["python-software-properties"],
  }

  package { "nginx" : ensure => present, }

  service { "nginx": ensure => running, }
  if ! defined(Package["python-software-properties"]) { package { "python-software-properties": ensure => latest, }}
  Exec { path => "/bin:/usr/bin:/sbin:/usr/sbin" }
} 
