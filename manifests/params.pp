# == Class: blender::params
#
# Define default parameters.
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class blender::params {

  $package = 'blender'
  $version = '2.68'
  $build = 'a'
  $mirror = 'http://download.blender.org'

}