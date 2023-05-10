#Fixes a wordpress site returning a error, running on apache2
exec { 'fix-wordpress':
    provider => 'shell',
    command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php; sudo service apache2 restart',
    path    => ['/bin', '/usr/bin'],
    onlyif  => '/usr/bin/test ! -r /var/www/html/wp-config.php',
}

