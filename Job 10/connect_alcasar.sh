#!/bin/bash

#curl --user maxime.billon-grand@laplateforme.io:XXXXX https://alcasar.laplateforme.io/intercept.php -v

# --> Sur Firefox, on trouve que c'est cette URL qui est envoyée dés que l'on lance la connexion:
# https://alcasar.laplateforme.io:3991/logon?username=maxime.billon-grand@laplateforme.io&password=555c9a4d31620334&userurl=http://www.euronews.com/
# La partie "password=555c9a4d31620334" est une chaine qui change à chaque connexion

# --> Sur la page Github d'Alcasar, on trouve ceci sur la partie connexion:
# Ligne 326 - $hexchal = pack ("H32", $challenge);
# Ligne 327 - $newchal = pack ("H*", md5($hexchal . $uamsecret));
# Ligne 328 - $response = md5("\0" . $password . $newchal);
# Ligne 329 - $newpwd = pack("a32", $password);
# Ligne 330 - $pappassword = implode ("", unpack("H32", ($newpwd ^ $newchal)));
# 
# --> De plus, l'URL est générée avec cette méthode :
# ligne 338 - <meta http-equiv=\"refresh\" content=\"0;url=http://$uamip:$uamport/logon?username=$username&password=$pappassword&userurl=$userurl\">

# --> C'est donc bien la variable "$pappassword" qui crée la chaine de caractère

# --> Il faudrait commencer par faire subir le même traitement à $2, le deuxième argument du script, le password,
# que décrit sur les lignes 326 à 330 du github Alcasar pour avoir une chaine de caractères potetiellement acceptable par Alcasar.
# 
#
# 





