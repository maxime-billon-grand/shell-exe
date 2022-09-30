#!/bin/bash

#curl --user maxime.billon-grand@laplateforme.io:N28m9y6z https://alcasar.laplateforme.io/intercept.php -v
#var1=HELLO
#var=${var1,,}
#echo $var

$hexchal = pack ("H32", $challenge);
$newchal = pack ("H*", md5($hexchal . $uamsecret));
$response = md5("\0" . $password . $newchal);
$newpwd = pack("a32", $password);
$pappassword = implode ("", unpack("H32", ($newpwd ^ $newchal)));




