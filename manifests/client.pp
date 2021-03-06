class conjur::client (
	$version = "4.30.1",
){

	if ($version == "4.30.1" or 
	    $version == "4.30.0") {
		$source = "https://github.com/conjurinc/cli-ruby/releases/download/v$version/conjur-$version-1"

	} else {
		$source = "https://s3.amazonaws.com/conjur-releases/omnibus/conjur-$version-1"
	}
				
	if ($osfamily == "RedHat") {

	 	package { conjur:
    			provider => rpm,
			ensure => "$version-1.el6",
    			source => "$source.el6.x86_64.rpm",
		}
	} else {
		fail("Unsupported osfamily == $osfamily")
	}

}
