#!/usr/bin/env bash
set -o errexit
# Comparateur de serveurs SpeedTest sous license Apache version 2.0
# https://lafibre.info/tester-son-debit/comp-speedtest/
# Vivien GUEANT / LaFibre.info
# Version 1.01

#### Dépendances à installer avant de lancer le script
# sudo apt install speedtest-cli

#### Fichier de log au format .csv
readonly FILE_LOG=./$(date +%Y%m%d-%H%M)-comp-speedtest.csv

#### Fonction de test de débit
speedtest ()
{
   local server="$1"
   speedtest-cli --no-upload --csv --timeout 1 --secure --server ${server} 2>&1 | cut -d',' -f 1,2,3,4,6,7 >> "${FILE_LOG}" 2>/dev/null
   local resultat=$(tail -n1 "${FILE_LOG}")
   local debit=$(echo "${resultat}" | cut -d',' -f 6 | cut -d'.' -f 1)
   if expr "$debit" : "^[0-9][0-9]*$" >/dev/null
   then
      local latence=$(echo "${resultat}" | cut -d',' -f 5 | cut -d'.' -f 1)
      if [[ $debit -ge 1000000 ]];
      then
         echo ": $((debit/1000000)) Mb/s - ${latence} ms"
      else
         echo ": Échec débit nul - ${latence} ms"
      fi
   else
      echo ": Échec serveur indisponible"
   fi
}

#### Début du script bash
echo "Merci de ne pas utiliser votre PC pendant les tests"

# test version speedtest-cli
PATH=$PATH:$(pwd)

version=$(speedtest-cli --version)
version=${version%%.*}
echo version de speedtest-cli : $version
if (( $version < 2 )); then
    echo "Ce script necessite au moins la version 2.0 de speedtest-cli"
    exit
fi

# Gérer l'en-tête du fichier CSV
echo speedtest-cli --csv-header >> "${FILE_LOG}"

# Tests de débit

# 1. chargement de la liste des serveurs

INPUT=${1:-/dev/stdin}
[ ! -f $INPUT ] && { echo "$1 fichier liste des serveurs non trouvé "; exit 99; }

readarray -t servers < $INPUT

maxn="${#servers[@]}"

echo nombre de serveurs a tester : $maxn

# 2. lancement des tests
n=1
for s in "${servers[@]}"
do
  IFS=',' read -r name city server <<< $s
  printf "Test n° %2s / %s $name $city" $n $maxn
  speedtest ${server}
  ((n++))
done

echo "Tests terminés !"
echo "Merci d'uploader votre fichier de résultat ${FILE_LOG} sur https://lafibre.info/tester-son-debit/comp-speedtest/"
