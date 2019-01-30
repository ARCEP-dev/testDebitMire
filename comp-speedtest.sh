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
   speedtest-cli --no-upload --csv --timeout 1 --secure --server "${server}" 2>&1 | cut -d',' -f 1,2,3,4,6,7 >> "${FILE_LOG}" 2>/dev/null
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

# Gérer l'en-tête du fichier CSV
speedtest-cli --csv-header >> "${FILE_LOG}"

# Tests de débit
echo -n "Test n° 1 / 92 Orange         - Paris      "
speedtest 5559
echo -n "Test n° 2 / 92 SFR            - Paris      "
speedtest 12746
echo -n "Test n° 3 / 92 SiriusHD       - Paris      "
speedtest 10676
echo -n "Test n° 4 / 92 Naitways       - Paris      "
speedtest 16476
echo -n "Test n° 5 / 92 fdcservers.net - Paris      "
speedtest 6027
echo -n "Test n° 6 / 92 CCleaner       - Paris      "
speedtest 16676
echo -n "Test n° 7 / 92 HarryLafranc   - Paris      "
speedtest 10176
echo -n "Test n° 8 / 92 Interoute VDC  - Paris      "
speedtest 10265
echo -n "Test n° 9 / 92 Cloudwatt      - Paris      "
speedtest 5582
echo -n "Test n°10 / 92 Télécom Paris  - Paris      "
speedtest 11977
echo -n "Test n°11 / 92 Extragornax    - Paris      "
speedtest 22902
echo -n "Test n°12 / 92 Host-Heberg    - Paris      "
speedtest 22086
echo -n "Test n°13 / 92 Stella Telecom - Courbevoie "
speedtest 14821
echo -n "Test n°14 / 92 Ozone          - Courbevoie "
speedtest 11644
echo -n "Test n°15 / 92 Scaleway/Online- Vitry/Seine"
speedtest 5022
echo -n "Test n°16 / 92 TestDebit.info - Massy      "
speedtest 2231
echo -n "Test n°17 / 92 Orange         - Lyon       "
speedtest 4273
echo -n "Test n°18 / 92 LaFibre.info   - Lyon       "
speedtest 2023
echo -n "Test n°19 / 92 Via Numérica   - Archamps   "
speedtest 3596
echo -n "Test n°20 / 92 Rocho DataCente- Chambéry   "
speedtest 11457
echo -n "Test n°21 / 92 Ikoula         - Reims      "
speedtest 5813
echo -n "Test n°22 / 92 RIV54          - Saulnes    "
speedtest 14372
echo -n "Test n°23 / 92 ORNE THD       - Rombas     "
speedtest 17349
echo -n "Test n°24 / 92 Vialis         - Woippy     "
speedtest 13661
echo -n "Test n°25 / 92 REFO Falck     - Falck      "
speedtest 21216
echo -n "Test n°26 / 92 Enes           - Hombourg   "
speedtest 21268
echo -n "Test n°27 / 92 Fibragglo      - Forbach    "
speedtest 16232
echo -n "Test n°28 / 92 La Regie       - Reichshoffe"
speedtest 14043
echo -n "Test n°29 / 92 AS Dienstleistu- Strasbourg "
speedtest 5962
echo -n "Test n°30 / 92 LaFibre.info   - Douai      "
speedtest 4010
echo -n "Test n°31 / 92 ePlay TV       - Roubaix    "
speedtest 2951
echo -n "Test n°32 / 92 Vianet         - Le Havre   "
speedtest 22378
echo -n "Test n°33 / 92 LaFibre.info   - Bordeaux   "
speedtest 21415
echo -n "Test n°34 / 92 Axione         - Pau        "
speedtest 11677
echo -n "Test n°35 / 92 TestDebit.info - Marseille  "
speedtest 4036
echo -n "Test n°36 / 92 Orange         - Marseille  "
speedtest 4661
echo -n "Test n°37 / 92 SEACOM         - Marseille  "
speedtest 17389
echo -n "Test n°38 / 92 DFOX           - Nice       "
speedtest 8195
echo -n "Test n°39 / 92 Andorra Telecom- Andorra    "
speedtest 2530
echo -n "Test n°40 / 92 Univ Catholique- Louvain    "
speedtest 4812
echo -n "Test n°41 / 92 Proximus       - Brussels   "
speedtest 12627
echo -n "Test n°42 / 92 Combell        - Brussels   "
speedtest 5151
echo -n "Test n°43 / 92 Orange Belgium - Brussels   "
speedtest 4319
echo -n "Test n°44 / 92 ASP            - Brussels   "
speedtest 21086
echo -n "Test n°45 / 92 SKSGroup       - Brussels   "
speedtest 11193
echo -n "Test n°46 / 92 Proximus       - Schaarbeek "
speedtest 10986
echo -n "Test n°47 / 92 Cu.be Solutions- Diegem     "
speedtest 2848
echo -n "Test n°48 / 92 EDPnet         - SintNiklaas"
speedtest 4320
echo -n "Test n°49 / 92 Nucleus BVBA   - Antwerp    "
speedtest 2955
echo -n "Test n°50 / 92 VOO            - Liège      "
speedtest 12306
echo -n "Test n°51 / 92 Join Experience- Kayl       "
speedtest 5003
echo -n "Test n°52 / 92 Docler Holding - Bettembourg"
speedtest 5438
echo -n "Test n°53 / 92 POST Luxembourg- Luxembourg "
speedtest 1360
echo -n "Test n°54 / 92 Broadcasting C - Luxembourg "
speedtest 4769
echo -n "Test n°55 / 92 Eltrona Interd - Luxembourg "
speedtest 10779
echo -n "Test n°56 / 92 Datacenter Lux - Luxembourg "
speedtest 3271
echo -n "Test n°57 / 92 LuxNetwork     - Hesperange "
speedtest 15055
echo -n "Test n°58 / 92 Lab Luxembourg - Contern    "
speedtest 5515
echo -n "Test n°59 / 92 Visual Online  - Contern    "
speedtest 6414
echo -n "Test n°60 / 92 SIG-Telecom    - Geneva     "
speedtest 3228
echo -n "Test n°61 / 92 Interoute VDC  - Geneva     "
speedtest 10281
echo -n "Test n°62 / 92 Infomaniak     - Carouge    "
speedtest 15690
echo -n "Test n°63 / 92 Salt           - Lausanne   "
speedtest 16325
echo -n "Test n°64 / 92 SIL Citycable  - Lausanne   "
speedtest 7526
echo -n "Test n°65 / 92 Wingo          - Lausanne   "
speedtest 16522
echo -n "Test n°66 / 92 AlpineDC       - Lausanne   "
speedtest 3930
echo -n "Test n°67 / 92 Swiss Network  - Lausanne   "
speedtest 7483
echo -n "Test n°68 / 92 World-Connect  - Lausanne   "
speedtest 8782
echo -n "Test n°69 / 92 IWB Telekom    - Basel      "
speedtest 15874
echo -n "Test n°70 / 92 green.ch       - Lupfig     "
speedtest 16497
echo -n "Test n°71 / 92 Monzoon        - Zweidlen   "
speedtest 15728
echo -n "Test n°72 / 92 FSIT           - Dietikon   "
speedtest 5155
echo -n "Test n°73 / 92 netplus.ch     - Sierre     "
speedtest 9087
echo -n "Test n°74 / 92 GIB-Solutions  - Uitikon    "
speedtest 10842
echo -n "Test n°75 / 92 iway           - Zurich     "
speedtest 3188
echo -n "Test n°76 / 92 nexellent      - Zurich     "
speedtest 6251
echo -n "Test n°77 / 92 Wingo          - Zurich     "
speedtest 12743
echo -n "Test n°78 / 92 Interoute VDC  - Zurich     "
speedtest 10266
echo -n "Test n°79 / 92 Glattwerk      - Dübendorf  "
speedtest 19637
echo -n "Test n°80 / 92 meddin.ch      - Zürich     "
speedtest 21379
echo -n "Test n°81 / 92 Netstream      - Duebendorf "
speedtest 1591
echo -n "Test n°82 / 92 GGA Maur       - Binz       "
speedtest 3821
echo -n "Test n°83 / 92 Datasource     - Zug        "
speedtest 3411
echo -n "Test n°84 / 92 Init 7         - Winterthur "
speedtest 3026
echo -n "Test n°85 / 92 DC Light       - Linthal    "
speedtest 15674
echo -n "Test n°86 / 92 Ticinocom      - Locarno    "
speedtest 2755
echo -n "Test n°87 / 92 BERNARDO.FM    - Chur       "
speedtest 2755
echo -n "Test n°88 / 92 Azienda Multise- Bellinzona "
speedtest 6820
echo -n "Test n°89 / 92 InternetONE    - Lugano     "
speedtest 9651
echo -n "Test n°90 / 92 GOLINE         - Stabio     "
speedtest 4492
echo -n "Test n°91 / 92 Mercury Labs   - Mendrisio  "
speedtest 10492
echo -n "Test n°92 / 92 Wibox          - Val de Reuil"
speedtest 16920

echo "Tests terminés !"
echo "Merci d'uploader votre fichier de résultat ${FILE_LOG} sur https://lafibre.info/tester-son-debit/comp-speedtest/"
