class { 'postgresql::server':
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*',
  postgres_password          => 'postgres',

}

postgresql::server::db { 'model':
  user     => 'pippo',
  password => postgresql_password('pippo', 'pippo'),
}