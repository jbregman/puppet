class conjur (
  $conjur_certificate = undef,
  $conjur_account = undef,
  $conjur_url = undef,

  $host_id = undef,
  $host_key = undef,
  $hostfactory_token = undef,

  $client_install = true,
  $host_config = true,

  $certificate_path = "/etc/conjur-$conjur_account.pem",
  $netrc_path = '/etc/conjur.identity'
) {

  if !$client_install and !host_config {
	fail ("Either client_install or host_config is required")
  }

  if $client_install {
    contain ::conjur::client
  }

  if $host_config {
	if $conjur_account == undef {
		fail("conjur_account is required if host_config = true")
	}
  	contain ::conjur::config
  	contain ::conjur::host_identity
  }

}
