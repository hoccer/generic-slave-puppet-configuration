define line($file, $line, $ensure = 'present') {
    case $ensure {
        default : { err ( "unknown ensure value ${ensure}" ) }
        present: {
            exec { "/bin/echo '${line}' >> '${file}'":
                unless => "/bin/grep -qFx '${line}' '${file}'"
            }
        }
        absent: {
            exec { "/bin/grep -vFx '${line}' '${file}' | /usr/bin/tee '${file}' > /dev/null 2>&1":
              onlyif => "/bin/grep -qFx '${line}' '${file}'"
            }

            # Use this resource instead if your platform's grep doesn't support -vFx;
            # note that this command has been known to have problems with lines containing quotes.
            # exec { "/usr/bin/perl -ni -e 'print unless /^\\Q${line}\\E\$/' '${file}'":
            #     onlyif => "/bin/grep -qFx '${line}' '${file}'"
            # }
        }
    }
}


include backuppc-client
include deployment-user
include jenkins-user
include nrpe
include java
include maven

maven::settings { 'maven-user-settings' :
  mirrors => [{ id => "archiva.hoccer.de", url => "https://archiva.hoccer.de/repository/internal/", mirrorof => "external:*,!snapshots" }],
  repos => [ { id => "snapshots", name => "Archiva Managed Snapshot Repository", url => "https://archiva.hoccer.de/repository/snapshots/", snapshots => { enabled => true} }],
  user    => 'jenkins'
}

package { "pwgen":
    ensure => "installed"
}
