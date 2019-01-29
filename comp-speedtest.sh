#!/usr/bin/env bash
set -o errexit
# Comparateur de serveurs SpeedTest sous license Apache version 2.0
# https://lafibre.info/tester-son-debit/comp-speedtest/
# Vivien GUEANT / LaFibre.info / Contact: https://twitter.com/lafibreinfo
# Version 1.00 - 29 janvier 2018

#### Dépendances à installer avant de lancer le script
# sudo apt install speedtest-cli

#### Fichier de log au format .csv
FILE_LOG=./`date +%Y%m%d-%H%M`-comp-speedtest.csv

#### Fonction de test de débit
speedtest ()
{
   speedtest-cli --no-upload --csv --timeout 1 --secure --server $1 2>&1 | cut -d',' -f 1,2,3,4,6,7 >>${FILE_LOG} 2>/dev/null
   resultat=$(tail -n1 ${FILE_LOG})
   debit=$(echo $resultat | cut -d',' -f 6 | cut -d'.' -f 1)
   if expr "$debit" : "^[0-9][0-9]*$" >/dev/null
   then
      latence=$(echo $resultat | cut -d',' -f 5 | cut -d'.' -f 1)
      if [ "$debit" -ge 1000000 ];
      then
         echo ": $(($debit/1000000)) Mb/s - $latence ms"
      else
         echo ": Échec débit nul - $latence ms"
      fi
   else
      echo ": Échec serveur indisponible"
   fi
}

#### Début du script bash
echo "Merci de ne pas utiliser votre PC pendant les tests"

# Gérer l'en-tête du fichier CSV
speedtest-cli --csv-header >>${FILE_LOG}

# Tests de débit
echo -n "Test n° 1 / 91 Orange         - Paris      "
speedtest 5559
echo -n "Test n° 2 / 91 SFR            - Paris      "
speedtest 12746
echo -n "Test n° 3 / 91 SiriusHD       - Paris      "
speedtest 10676
echo -n "Test n° 4 / 91 Naitways       - Paris      "
speedtest 16476
echo -n "Test n° 5 / 91 fdcservers.net - Paris      "
speedtest 6027
echo -n "Test n° 6 / 91 CCleaner       - Paris      "
speedtest 16676
echo -n "Test n° 7 / 91 HarryLafranc   - Paris      "
speedtest 10176
echo -n "Test n° 8 / 91 Interoute VDC  - Paris      "
speedtest 10265
echo -n "Test n° 9 / 91 Cloudwatt      - Paris      "
speedtest 5582
echo -n "Test n°10 / 91 Télécom Paris  - Paris      "
speedtest 11977
echo -n "Test n°11 / 91 Extragornax    - Paris      "
speedtest 22902
echo -n "Test n°12 / 91 Host-Heberg    - Paris      "
speedtest 22086
echo -n "Test n°13 / 91 Stella Telecom - Courbevoie "
speedtest 14821
echo -n "Test n°14 / 91 Ozone          - Courbevoie "
speedtest 11644
echo -n "Test n°15 / 91 Scaleway/Online- Vitry/Seine"
speedtest 5022
echo -n "Test n°16 / 91 TestDebit.info - Massy      "
speedtest 2231
echo -n "Test n°17 / 91 Orange         - Lyon       "
speedtest 4273
echo -n "Test n°18 / 91 LaFibre.info   - Lyon       "
speedtest 2023
echo -n "Test n°19 / 91 Via Numérica   - Archamps   "
speedtest 3596
echo -n "Test n°20 / 91 Rocho DataCente- Chambéry   "
speedtest 11457
echo -n "Test n°21 / 91 Ikoula         - Reims      "
speedtest 5813
echo -n "Test n°22 / 91 RIV54          - Saulnes    "
speedtest 14372
echo -n "Test n°23 / 91 ORNE THD       - Rombas     "
speedtest 17349
echo -n "Test n°24 / 91 Vialis         - Woippy     "
speedtest 13661
echo -n "Test n°25 / 91 REFO Falck     - Falck      "
speedtest 21216
echo -n "Test n°26 / 91 Enes           - Hombourg   "
speedtest 21268
echo -n "Test n°27 / 91 Fibragglo      - Forbach    "
speedtest 16232
echo -n "Test n°28 / 91 La Regie       - Reichshoffe"
speedtest 14043
echo -n "Test n°29 / 91 AS Dienstleistu- Strasbourg "
speedtest 5962
echo -n "Test n°30 / 91 LaFibre.info   - Douai      "
speedtest 4010
echo -n "Test n°31 / 91 ePlay TV       - Roubaix    "
speedtest 2951
echo -n "Test n°32 / 91 Vianet         - Le Havre   "
speedtest 22378
echo -n "Test n°33 / 91 LaFibre.info   - Bordeaux   "
speedtest 21415
echo -n "Test n°34 / 91 Axione         - Pau        "
speedtest 11677
echo -n "Test n°35 / 91 TestDebit.info - Marseille  "
speedtest 4036
echo -n "Test n°36 / 91 Orange         - Marseille  "
speedtest 4661
echo -n "Test n°37 / 91 SEACOM         - Marseille  "
speedtest 17389
echo -n "Test n°38 / 91 DFOX           - Nice       "
speedtest 8195
echo -n "Test n°39 / 91 Andorra Telecom- Andorra    "
speedtest 2530
echo -n "Test n°40 / 91 Univ Catholique- Louvain    "
speedtest 4812
echo -n "Test n°41 / 91 Proximus       - Brussels   "
speedtest 12627
echo -n "Test n°42 / 91 Combell        - Brussels   "
speedtest 5151
echo -n "Test n°43 / 91 Orange Belgium - Brussels   "
speedtest 4319
echo -n "Test n°44 / 91 ASP            - Brussels   "
speedtest 21086
echo -n "Test n°45 / 91 SKSGroup       - Brussels   "
speedtest 11193
echo -n "Test n°46 / 91 Proximus       - Schaarbeek "
speedtest 10986
echo -n "Test n°47 / 91 Cu.be Solutions- Diegem     "
speedtest 2848
echo -n "Test n°48 / 91 EDPnet         - SintNiklaas"
speedtest 4320
echo -n "Test n°49 / 91 Nucleus BVBA   - Antwerp    "
speedtest 2955
echo -n "Test n°50 / 91 VOO            - Liège      "
speedtest 12306
echo -n "Test n°51 / 91 Join Experience- Kayl       "
speedtest 5003
echo -n "Test n°52 / 91 Docler Holding - Bettembourg"
speedtest 5438
echo -n "Test n°53 / 91 POST Luxembourg- Luxembourg "
speedtest 1360
echo -n "Test n°54 / 91 Broadcasting C - Luxembourg "
speedtest 4769
echo -n "Test n°55 / 91 Eltrona Interd - Luxembourg "
speedtest 10779
echo -n "Test n°56 / 91 Datacenter Lux - Luxembourg "
speedtest 3271
echo -n "Test n°57 / 91 LuxNetwork     - Hesperange "
speedtest 15055
echo -n "Test n°58 / 91 Lab Luxembourg - Contern    "
speedtest 5515
echo -n "Test n°59 / 91 Visual Online  - Contern    "
speedtest 6414
echo -n "Test n°60 / 91 SIG-Telecom    - Geneva     "
speedtest 3228
echo -n "Test n°61 / 91 Interoute VDC  - Geneva     "
speedtest 10281
echo -n "Test n°62 / 91 Infomaniak     - Carouge    "
speedtest 15690
echo -n "Test n°63 / 91 Salt           - Lausanne   "
speedtest 16325
echo -n "Test n°64 / 91 SIL Citycable  - Lausanne   "
speedtest 7526
echo -n "Test n°65 / 91 Wingo          - Lausanne   "
speedtest 16522
echo -n "Test n°66 / 91 AlpineDC       - Lausanne   "
speedtest 3930
echo -n "Test n°67 / 91 Swiss Network  - Lausanne   "
speedtest 7483
echo -n "Test n°68 / 91 World-Connect  - Lausanne   "
speedtest 8782
echo -n "Test n°69 / 91 IWB Telekom    - Basel      "
speedtest 15874
echo -n "Test n°70 / 91 green.ch       - Lupfig     "
speedtest 16497
echo -n "Test n°71 / 91 Monzoon        - Zweidlen   "
speedtest 15728
echo -n "Test n°72 / 91 FSIT           - Dietikon   "
speedtest 5155
echo -n "Test n°73 / 91 netplus.ch     - Sierre     "
speedtest 9087
echo -n "Test n°74 / 91 GIB-Solutions  - Uitikon    "
speedtest 10842
echo -n "Test n°75 / 91 iway           - Zurich     "
speedtest 3188
echo -n "Test n°76 / 91 nexellent      - Zurich     "
speedtest 6251
echo -n "Test n°77 / 91 Wingo          - Zurich     "
speedtest 12743
echo -n "Test n°78 / 91 Interoute VDC  - Zurich     "
speedtest 10266
echo -n "Test n°79 / 91 Glattwerk      - Dübendorf  "
speedtest 19637
echo -n "Test n°80 / 91 meddin.ch      - Zürich     "
speedtest 21379
echo -n "Test n°81 / 91 Netstream      - Duebendorf "
speedtest 1591
echo -n "Test n°82 / 91 GGA Maur       - Binz       "
speedtest 3821
echo -n "Test n°83 / 91 Datasource     - Zug        "
speedtest 3411
echo -n "Test n°84 / 91 Init 7         - Winterthur "
speedtest 3026
echo -n "Test n°85 / 91 DC Light       - Linthal    "
speedtest 15674
echo -n "Test n°86 / 91 Ticinocom      - Locarno    "
speedtest 2755
echo -n "Test n°87 / 91 BERNARDO.FM    - Chur       "
speedtest 2755
echo -n "Test n°88 / 91 Azienda Multise- Bellinzona "
speedtest 6820
echo -n "Test n°89 / 91 InternetONE    - Lugano     "
speedtest 9651
echo -n "Test n°90 / 91 GOLINE         - Stabio     "
speedtest 4492
echo -n "Test n°91 / 91 Mercury Labs   - Mendrisio  "
speedtest 10492

echo "Tests terminés !"
echo "Merci d'uploader votre fichier de résultat ${FILE_LOG} sur https://lafibre.info/tester-son-debit/comp-speedtest/"
