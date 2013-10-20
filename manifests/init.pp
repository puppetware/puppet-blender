# == Class: blender
#
# Install Blender.
#
# === Parameters:
#
# [*build*] Build of Blender
# [*version*] Version of Blender
# [*mirror*] Version of Blender
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class blender(
  $build = $blender::params::build,
  $mirror = $blender::params::mirror,
  $version = $blender::params::version
) inherits blender::params {

  anchor {'blender::begin': } ->
  class {'blender::install': } ->
  anchor {'blender::end': }

}