default[:paco] = {
  :bin    => '/usr/local/bin/paco',
  :opt    => [
    '--disable-gpaco',
  ],
}
default[:apache24][:packages] = {
  'apr' => {
    'source' => 'apr-1.5.0',
    'opt'    => [
      '--prefix=/usr/local/apr',
    ],
  },
  'apr-util' => {
    'source' => 'apr-util-1.5.3',
    'root'   => '/usr/local/apr',
    'opt'    => [
      '--with-apr=/usr/local/apr',
    ],
  },
  'httpd' => {
    'source' => 'httpd-2.4.7',
    'root'   => '/usr/local/apache2.4',
    'opt'    => [
      '--prefix=/usr/local/apache2.4',
      '--enable-mods-shared=most',
      '--enable-ssl=shared',
      '--enable-proxy=shared',
      '--enable-remoteip=shared',
      '--with-mpm=prefork',
    ],
  },
}
