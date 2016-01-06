# ext/moment/extconf.rb
ENV['RC_ARCHS'] = '' if RUBY_PLATFORM =~ /darwin/

require 'mkmf'
require 'date'
extension_name = 'moment'
LIBDIR     = RbConfig::CONFIG['libdir']
INCLUDEDIR = RbConfig::CONFIG['includedir']

# HEADER_DIRS = [INCLUDEDIR]

# setup constant that is equal to that of the file path that holds that static libraries that will need to be compiled against
# LIB_DIRS = [LIBDIR, File.expand_path(File.join(File.dirname(__FILE__), "lib"))]
# LIBDIR      = RbConfig::CONFIG['libdir']
# INCLUDEDIR  = RbConfig::CONFIG['includedir']

# # LIB_DIRS = [LIBDIR, File.expand_path(File.join(File.dirname(__FILE__), "lib"))]

HEADER_DIRS = [
  # First search /opt/local for macports
  '/opt/local/include',

  # Then search /usr/local for people that installed from source
  '/usr/local/include',

  # Check the ruby install locations
  INCLUDEDIR,

  # Finally fall back to /usr
  '/usr/include',
]

LIB_DIRS = [
  # First search /opt/local for macports
  '/opt/local/lib',

  # Then search /usr/local for people that installed from source
  '/usr/local/lib',

  # Check the ruby install locations
  LIBDIR,
  File.expand_path(File.join(File.dirname(__FILE__), "lib")),

  # Finally fall back to /usr
  '/usr/lib',
]


libs = ['-lmoment']

dir_config("moment", HEADER_DIRS, LIB_DIRS)

unless find_header('TimeParser.h')
  abort "TimeParser is missing.  please install TimeParser"
end

# iterate though the libs array, and append them to the $LOCAL_LIBS array used for the makefile creation
libs.each do |lib|
  $LOCAL_LIBS << "#{lib} "
end



create_makefile("moment/moment")
