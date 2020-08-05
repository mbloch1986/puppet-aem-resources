java_ks { 'Set up keystore':
  ensure       => latest,
  name         => 'cqse',
  certificate  => '/tmp/shinesolutions/puppet-aem-resources/aem.cert',
  target       => '/tmp/shinesolutions/puppet-aem-resources/aem.ks',
  private_key  => '/tmp/shinesolutions/puppet-aem-resources/aem.key',
  password     => 'somekeystorepassword',
  trustcacerts => true,
}

java_ks { 'Set up truststore':
  ensure       => latest,
  name         => 'cqse',
  certificate  => '/tmp/shinesolutions/puppet-aem-resources/aem.cert',
  target       => '/tmp/shinesolutions/puppet-aem-resources/aem.ts',
  password     => 'sometruststorepassword',
  trustcacerts => true,
}

aem_resources::author_publish_enable_ssl { 'Enable author/publish SSL via Jetty':
  run_mode            => 'author',
  aem_id              => 'author',
  ssl_method          => 'jetty',
  port                => 5432,
  keystore            => '/tmp/shinesolutions/puppet-aem-resources/aem.ks',
  keystore_password   => 'somekeystorepassword',
  keystore_key_alias  => 'cqse',
  truststore          => '/tmp/shinesolutions/puppet-aem-resources/aem.ts',
  truststore_password => 'sometruststorepassword',
}
