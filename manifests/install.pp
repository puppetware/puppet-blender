# == Class: blender::install
#
# Install Blender.
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class blender::install {

  $build = $blender::build
  $mirror = $blender::mirror
  $version = $blender::version

  $source = downcase($::osfamily) ? {
    'darwin' => "${mirror}/release/Blender${version}/blender-${version}${build}-OSX_10.6-${architecture}.zip",
    #'linux' => "${mirror}/release/Blender${version}/blender-${version}${build}-linux-glibc211-${architecture}.tar.bz2",
    default => fail("Unsupported operating system: ${::osfamily}")
  }
  
  Exec {
    cwd => '/tmp',
    path => '/usr/sbin:/usr/bin:/bin',
    onlyif => "test ! -f /var/db/.puppet_binary_installed_blender-${version}",
  }

  exec {"blender-download":
    command => "curl -o blender-${version}${build}-OSX_10.6-${architecture}.zip -k -L -s --url ${source}",
    timeout => 0,
  }
  ->
  exec {'blender-install':
    command => "unzip blender-${version}${build}-OSX_10.6-${architecture}.zip -d /Applications",
    user => 'root',
  }
  ->
  file {"/tmp/blender-${version}${build}-OSX_10.6-${architecture}.zip":
    ensure => absent,
    force => true,
  }
  ->
  file {"/var/db/.puppet_binary_installed_blender-${version}":
    ensure => file,
    content => "name:'blender'\nsource:'${source}'",
    owner => 'root',
    group => 'wheel',
    mode => '0644',
  }

}