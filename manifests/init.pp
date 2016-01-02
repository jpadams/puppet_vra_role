class puppet_vra_role {

  file { '/opt/puppetlabs/server/data/packages/public/post-install-fact.sh':
    ensure => file,
    source => 'puppet:///modules/puppet_vra_role/post-install-fact.sh',
  }

  file { '/opt/puppetlabs/server/data/packages/public/post-install-trusted.sh':
    ensure => file,
    source => 'puppet:///modules/puppet_vra_role/post-install-trusted.sh',
  }
}
