#== # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# INPE - Instituto Nacional de Pesquisas Espaciais
# ETE  - Engenharia e Tecnologia Espacial
# DSE  - Divisão de Sistemas Espaciais
#
# Author: Ronan Arraes Jardim Chagas <ronan.arraes@inpe.br>
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Description
#
#   Coefficients for the IGRF v12 to be used in the function `igrf12syn`.
#
#   This values were obtained from the FORTRAN source code [1].
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# References
#
#   [1] https://www.ngdc.noaa.gov/IAGA/vmod/igrf12.f
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Changelog
#
# 2018-04-29: Ronan Arraes Jardim Chagas <ronan.arraes@inpe.br>
#   Initial version.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # ==#

# The IGRF constant array in `igrf12.f` is composed by the concatenation of
# several arrays (`g0`, `g1`, ..., `gr`), each one with the coefficients related
# to a year. Hence, the final array to be used in the algorithm (`gh`) must be
# assembled using:
#
#   gh = [g0; g1; g2; ...; gr]
#
# The arrays have the following form:
#
#   -31543.,-2298., 5922., -677., 2905.,-1061.,  924., 1121., 1900
#
# The last element, which is the year, **must** be removed before those
# sub-arrays are concatenated.
#
# Furthermore, if the last element of the array has the following format:
#
#    N*0.0 ,
#
# it means that it has more `N` fields filed with 0.0. Then, in julia, it should
# be replaced by `zeros(N)...`.

const gh_igrf12 = [
      -31543.,-2298., 5922., -677., 2905.,-1061.,  924., 1121., # 1900
        1022.,-1469., -330., 1256.,    3.,  572.,  523.,  876., # 1900
         628.,  195.,  660.,  -69., -361., -210.,  134.,  -75., # 1900
        -184.,  328., -210.,  264.,   53.,    5.,  -33.,  -86., # 1900
        -124.,  -16.,    3.,   63.,   61.,   -9.,  -11.,   83., # 1900
        -217.,    2.,  -58.,  -35.,   59.,   36.,  -90.,  -69., # 1900
          70.,  -55.,  -45.,    0.,  -13.,   34.,  -10.,  -41., # 1900
          -1.,  -21.,   28.,   18.,  -12.,    6.,  -22.,   11., # 1900
           8.,    8.,   -4.,  -14.,   -9.,    7.,    1.,  -13., # 1900
           2.,    5.,   -9.,   16.,    5.,   -5.,    8.,  -18., # 1900
           8.,   10.,  -20.,    1.,   14.,  -11.,    5.,   12., # 1900
          -3.,    1.,   -2.,   -2.,    8.,    2.,   10.,   -1., # 1900
          -2.,   -1.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1900
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1900
           0.,   -2.,    2.,    4.,    2.,    0.,    0.,   -6., # 1900
      -31464.,-2298., 5909., -728., 2928.,-1086., 1041., 1065., # 1905
        1037.,-1494., -357., 1239.,   34.,  635.,  480.,  880., # 1905
         643.,  203.,  653.,  -77., -380., -201.,  146.,  -65., # 1905
        -192.,  328., -193.,  259.,   56.,   -1.,  -32.,  -93., # 1905
        -125.,  -26.,   11.,   62.,   60.,   -7.,  -11.,   86., # 1905
        -221.,    4.,  -57.,  -32.,   57.,   32.,  -92.,  -67., # 1905
          70.,  -54.,  -46.,    0.,  -14.,   33.,  -11.,  -41., # 1905
           0.,  -20.,   28.,   18.,  -12.,    6.,  -22.,   11., # 1905
           8.,    8.,   -4.,  -15.,   -9.,    7.,    1.,  -13., # 1905
           2.,    5.,   -8.,   16.,    5.,   -5.,    8.,  -18., # 1905
           8.,   10.,  -20.,    1.,   14.,  -11.,    5.,   12., # 1905
          -3.,    1.,   -2.,   -2.,    8.,    2.,   10.,    0., # 1905
          -2.,   -1.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1905
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1905
           0.,   -2.,    2.,    4.,    2.,    0.,    0.,   -6., # 1905
      -31354.,-2297., 5898., -769., 2948.,-1128., 1176., 1000., # 1910
        1058.,-1524., -389., 1223.,   62.,  705.,  425.,  884., # 1910
         660.,  211.,  644.,  -90., -400., -189.,  160.,  -55., # 1910
        -201.,  327., -172.,  253.,   57.,   -9.,  -33., -102., # 1910
        -126.,  -38.,   21.,   62.,   58.,   -5.,  -11.,   89., # 1910
        -224.,    5.,  -54.,  -29.,   54.,   28.,  -95.,  -65., # 1910
          71.,  -54.,  -47.,    1.,  -14.,   32.,  -12.,  -40., # 1910
           1.,  -19.,   28.,   18.,  -13.,    6.,  -22.,   11., # 1910
           8.,    8.,   -4.,  -15.,   -9.,    6.,    1.,  -13., # 1910
           2.,    5.,   -8.,   16.,    5.,   -5.,    8.,  -18., # 1910
           8.,   10.,  -20.,    1.,   14.,  -11.,    5.,   12., # 1910
          -3.,    1.,   -2.,   -2.,    8.,    2.,   10.,    0., # 1910
          -2.,   -1.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1910
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1910
           0.,   -2.,    2.,    4.,    2.,    0.,    0.,   -6., # 1910
      -31212.,-2306., 5875., -802., 2956.,-1191., 1309.,  917., # 1915
        1084.,-1559., -421., 1212.,   84.,  778.,  360.,  887., # 1915
         678.,  218.,  631., -109., -416., -173.,  178.,  -51., # 1915
        -211.,  327., -148.,  245.,   58.,  -16.,  -34., -111., # 1915
        -126.,  -51.,   32.,   61.,   57.,   -2.,  -10.,   93., # 1915
        -228.,    8.,  -51.,  -26.,   49.,   23.,  -98.,  -62., # 1915
          72.,  -54.,  -48.,    2.,  -14.,   31.,  -12.,  -38., # 1915
           2.,  -18.,   28.,   19.,  -15.,    6.,  -22.,   11., # 1915
           8.,    8.,   -4.,  -15.,   -9.,    6.,    2.,  -13., # 1915
           3.,    5.,   -8.,   16.,    6.,   -5.,    8.,  -18., # 1915
           8.,   10.,  -20.,    1.,   14.,  -11.,    5.,   12., # 1915
          -3.,    1.,   -2.,   -2.,    8.,    2.,   10.,    0., # 1915
          -2.,   -1.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1915
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1915
           0.,   -2.,    1.,    4.,    2.,    0.,    0.,   -6., # 1915
      -31060.,-2317., 5845., -839., 2959.,-1259., 1407.,  823., # 1920
        1111.,-1600., -445., 1205.,  103.,  839.,  293.,  889., # 1920
         695.,  220.,  616., -134., -424., -153.,  199.,  -57., # 1920
        -221.,  326., -122.,  236.,   58.,  -23.,  -38., -119., # 1920
        -125.,  -62.,   43.,   61.,   55.,    0.,  -10.,   96., # 1920
        -233.,   11.,  -46.,  -22.,   44.,   18., -101.,  -57., # 1920
          73.,  -54.,  -49.,    2.,  -14.,   29.,  -13.,  -37., # 1920
           4.,  -16.,   28.,   19.,  -16.,    6.,  -22.,   11., # 1920
           7.,    8.,   -3.,  -15.,   -9.,    6.,    2.,  -14., # 1920
           4.,    5.,   -7.,   17.,    6.,   -5.,    8.,  -19., # 1920
           8.,   10.,  -20.,    1.,   14.,  -11.,    5.,   12., # 1920
          -3.,    1.,   -2.,   -2.,    9.,    2.,   10.,    0., # 1920
          -2.,   -1.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1920
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1920
           0.,   -2.,    1.,    4.,    3.,    0.,    0.,   -6., # 1920
      -30926.,-2318., 5817., -893., 2969.,-1334., 1471.,  728., # 1925
        1140.,-1645., -462., 1202.,  119.,  881.,  229.,  891., # 1925
         711.,  216.,  601., -163., -426., -130.,  217.,  -70., # 1925
        -230.,  326.,  -96.,  226.,   58.,  -28.,  -44., -125., # 1925
        -122.,  -69.,   51.,   61.,   54.,    3.,   -9.,   99., # 1925
        -238.,   14.,  -40.,  -18.,   39.,   13., -103.,  -52., # 1925
          73.,  -54.,  -50.,    3.,  -14.,   27.,  -14.,  -35., # 1925
           5.,  -14.,   29.,   19.,  -17.,    6.,  -21.,   11., # 1925
           7.,    8.,   -3.,  -15.,   -9.,    6.,    2.,  -14., # 1925
           4.,    5.,   -7.,   17.,    7.,   -5.,    8.,  -19., # 1925
           8.,   10.,  -20.,    1.,   14.,  -11.,    5.,   12., # 1925
          -3.,    1.,   -2.,   -2.,    9.,    2.,   10.,    0., # 1925
          -2.,   -1.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1925
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1925
           0.,   -2.,    1.,    4.,    3.,    0.,    0.,   -6., # 1925
      -30805.,-2316., 5808., -951., 2980.,-1424., 1517.,  644., # 1930
        1172.,-1692., -480., 1205.,  133.,  907.,  166.,  896., # 1930
         727.,  205.,  584., -195., -422., -109.,  234.,  -90., # 1930
        -237.,  327.,  -72.,  218.,   60.,  -32.,  -53., -131., # 1930
        -118.,  -74.,   58.,   60.,   53.,    4.,   -9.,  102., # 1930
        -242.,   19.,  -32.,  -16.,   32.,    8., -104.,  -46., # 1930
          74.,  -54.,  -51.,    4.,  -15.,   25.,  -14.,  -34., # 1930
           6.,  -12.,   29.,   18.,  -18.,    6.,  -20.,   11., # 1930
           7.,    8.,   -3.,  -15.,   -9.,    5.,    2.,  -14., # 1930
           5.,    5.,   -6.,   18.,    8.,   -5.,    8.,  -19., # 1930
           8.,   10.,  -20.,    1.,   14.,  -12.,    5.,   12., # 1930
          -3.,    1.,   -2.,   -2.,    9.,    3.,   10.,    0., # 1930
          -2.,   -2.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1930
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1930
           0.,   -2.,    1.,    4.,    3.,    0.,    0.,   -6., # 1930
      -30715.,-2306., 5812.,-1018., 2984.,-1520., 1550.,  586., # 1935
        1206.,-1740., -494., 1215.,  146.,  918.,  101.,  903., # 1935
         744.,  188.,  565., -226., -415.,  -90.,  249., -114., # 1935
        -241.,  329.,  -51.,  211.,   64.,  -33.,  -64., -136., # 1935
        -115.,  -76.,   64.,   59.,   53.,    4.,   -8.,  104., # 1935
        -246.,   25.,  -25.,  -15.,   25.,    4., -106.,  -40., # 1935
          74.,  -53.,  -52.,    4.,  -17.,   23.,  -14.,  -33., # 1935
           7.,  -11.,   29.,   18.,  -19.,    6.,  -19.,   11., # 1935
           7.,    8.,   -3.,  -15.,   -9.,    5.,    1.,  -15., # 1935
           6.,    5.,   -6.,   18.,    8.,   -5.,    7.,  -19., # 1935
           8.,   10.,  -20.,    1.,   15.,  -12.,    5.,   11., # 1935
          -3.,    1.,   -3.,   -2.,    9.,    3.,   11.,    0., # 1935
          -2.,   -2.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1935
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1935
           0.,   -1.,    2.,    4.,    3.,    0.,    0.,   -6., # 1935
      -30654.,-2292., 5821.,-1106., 2981.,-1614., 1566.,  528., # 1940
        1240.,-1790., -499., 1232.,  163.,  916.,   43.,  914., # 1940
         762.,  169.,  550., -252., -405.,  -72.,  265., -141., # 1940
        -241.,  334.,  -33.,  208.,   71.,  -33.,  -75., -141., # 1940
        -113.,  -76.,   69.,   57.,   54.,    4.,   -7.,  105., # 1940
        -249.,   33.,  -18.,  -15.,   18.,    0., -107.,  -33., # 1940
          74.,  -53.,  -52.,    4.,  -18.,   20.,  -14.,  -31., # 1940
           7.,   -9.,   29.,   17.,  -20.,    5.,  -19.,   11., # 1940
           7.,    8.,   -3.,  -14.,  -10.,    5.,    1.,  -15., # 1940
           6.,    5.,   -5.,   19.,    9.,   -5.,    7.,  -19., # 1940
           8.,   10.,  -21.,    1.,   15.,  -12.,    5.,   11., # 1940
          -3.,    1.,   -3.,   -2.,    9.,    3.,   11.,    1., # 1940
          -2.,   -2.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1940
          -5.,    2.,   -2.,    6.,    6.,   -4.,    4.,    0., # 1940
           0.,   -1.,    2.,    4.,    3.,    0.,    0.,   -6., # 1940
      -30594.,-2285., 5810.,-1244., 2990.,-1702., 1578.,  477., # 1945
        1282.,-1834., -499., 1255.,  186.,  913.,  -11.,  944., # 1945
         776.,  144.,  544., -276., -421.,  -55.,  304., -178., # 1945
        -253.,  346.,  -12.,  194.,   95.,  -20.,  -67., -142., # 1945
        -119.,  -82.,   82.,   59.,   57.,    6.,    6.,  100., # 1945
        -246.,   16.,  -25.,   -9.,   21.,  -16., -104.,  -39., # 1945
          70.,  -40.,  -45.,    0.,  -18.,    0.,    2.,  -29., # 1945
           6.,  -10.,   28.,   15.,  -17.,   29.,  -22.,   13., # 1945
           7.,   12.,   -8.,  -21.,   -5.,  -12.,    9.,   -7., # 1945
           7.,    2.,  -10.,   18.,    7.,    3.,    2.,  -11., # 1945
           5.,  -21.,  -27.,    1.,   17.,  -11.,   29.,    3., # 1945
          -9.,   16.,    4.,   -3.,    9.,   -4.,    6.,   -3., # 1945
           1.,   -4.,    8.,   -3.,   11.,    5.,    1.,    1., # 1945
           2.,  -20.,   -5.,   -1.,   -1.,   -6.,    8.,    6., # 1945
          -1.,   -4.,   -3.,   -2.,    5.,    0.,   -2.,   -2., # 1945
      -30554.,-2250., 5815.,-1341., 2998.,-1810., 1576.,  381., # 1950
        1297.,-1889., -476., 1274.,  206.,  896.,  -46.,  954., # 1950
         792.,  136.,  528., -278., -408.,  -37.,  303., -210., # 1950
        -240.,  349.,    3.,  211.,  103.,  -20.,  -87., -147., # 1950
        -122.,  -76.,   80.,   54.,   57.,   -1.,    4.,   99., # 1950
        -247.,   33.,  -16.,  -12.,   12.,  -12., -105.,  -30., # 1950
          65.,  -55.,  -35.,    2.,  -17.,    1.,    0.,  -40., # 1950
          10.,   -7.,   36.,    5.,  -18.,   19.,  -16.,   22., # 1950
          15.,    5.,   -4.,  -22.,   -1.,    0.,   11.,  -21., # 1950
          15.,   -8.,  -13.,   17.,    5.,   -4.,   -1.,  -17., # 1950
           3.,   -7.,  -24.,   -1.,   19.,  -25.,   12.,   10., # 1950
           2.,    5.,    2.,   -5.,    8.,   -2.,    8.,    3., # 1950
         -11.,    8.,   -7.,   -8.,    4.,   13.,   -1.,   -2., # 1950
          13.,  -10.,   -4.,    2.,    4.,   -3.,   12.,    6., # 1950
           3.,   -3.,    2.,    6.,   10.,   11.,    3.,    8., # 1950
      -30500.,-2215., 5820.,-1440., 3003.,-1898., 1581.,  291., # 1955
        1302.,-1944., -462., 1288.,  216.,  882.,  -83.,  958., # 1955
         796.,  133.,  510., -274., -397.,  -23.,  290., -230., # 1955
        -229.,  360.,   15.,  230.,  110.,  -23.,  -98., -152., # 1955
        -121.,  -69.,   78.,   47.,   57.,   -9.,    3.,   96., # 1955
        -247.,   48.,   -8.,  -16.,    7.,  -12., -107.,  -24., # 1955
          65.,  -56.,  -50.,    2.,  -24.,   10.,   -4.,  -32., # 1955
           8.,  -11.,   28.,    9.,  -20.,   18.,  -18.,   11., # 1955
           9.,   10.,   -6.,  -15.,  -14.,    5.,    6.,  -23., # 1955
          10.,    3.,   -7.,   23.,    6.,   -4.,    9.,  -13., # 1955
           4.,    9.,  -11.,   -4.,   12.,   -5.,    7.,    2., # 1955
           6.,    4.,   -2.,    1.,   10.,    2.,    7.,    2., # 1955
          -6.,    5.,    5.,   -3.,   -5.,   -4.,   -1.,    0., # 1955
           2.,   -8.,   -3.,   -2.,    7.,   -4.,    4.,    1., # 1955
          -2.,   -3.,    6.,    7.,   -2.,   -1.,    0.,   -3., # 1955
      -30421.,-2169., 5791.,-1555., 3002.,-1967., 1590.,  206., # 1960
        1302.,-1992., -414., 1289.,  224.,  878., -130.,  957., # 1960
         800.,  135.,  504., -278., -394.,    3.,  269., -255., # 1960
        -222.,  362.,   16.,  242.,  125.,  -26., -117., -156., # 1960
        -114.,  -63.,   81.,   46.,   58.,  -10.,    1.,   99., # 1960
        -237.,   60.,   -1.,  -20.,   -2.,  -11., -113.,  -17., # 1960
          67.,  -56.,  -55.,    5.,  -28.,   15.,   -6.,  -32., # 1960
           7.,   -7.,   23.,   17.,  -18.,    8.,  -17.,   15., # 1960
           6.,   11.,   -4.,  -14.,  -11.,    7.,    2.,  -18., # 1960
          10.,    4.,   -5.,   23.,   10.,    1.,    8.,  -20., # 1960
           4.,    6.,  -18.,    0.,   12.,   -9.,    2.,    1., # 1960
           0.,    4.,   -3.,   -1.,    9.,   -2.,    8.,    3., # 1960
           0.,   -1.,    5.,    1.,   -3.,    4.,    4.,    1., # 1960
           0.,    0.,   -1.,    2.,    4.,   -5.,    6.,    1., # 1960
           1.,   -1.,   -1.,    6.,    2.,    0.,    0.,   -7., # 1960
      -30334.,-2119., 5776.,-1662., 2997.,-2016., 1594.,  114., # 1965
        1297.,-2038., -404., 1292.,  240.,  856., -165.,  957., # 1965
         804.,  148.,  479., -269., -390.,   13.,  252., -269., # 1965
        -219.,  358.,   19.,  254.,  128.,  -31., -126., -157., # 1965
         -97.,  -62.,   81.,   45.,   61.,  -11.,    8.,  100., # 1965
        -228.,   68.,    4.,  -32.,    1.,   -8., -111.,   -7., # 1965
          75.,  -57.,  -61.,    4.,  -27.,   13.,   -2.,  -26., # 1965
           6.,   -6.,   26.,   13.,  -23.,    1.,  -12.,   13., # 1965
           5.,    7.,   -4.,  -12.,  -14.,    9.,    0.,  -16., # 1965
           8.,    4.,   -1.,   24.,   11.,   -3.,    4.,  -17., # 1965
           8.,   10.,  -22.,    2.,   15.,  -13.,    7.,   10., # 1965
          -4.,   -1.,   -5.,   -1.,   10.,    5.,   10.,    1., # 1965
          -4.,   -2.,    1.,   -2.,   -3.,    2.,    2.,    1., # 1965
          -5.,    2.,   -2.,    6.,    4.,   -4.,    4.,    0., # 1965
           0.,   -2.,    2.,    3.,    2.,    0.,    0.,   -6., # 1965
      -30220.,-2068., 5737.,-1781., 3000.,-2047., 1611.,   25., # 1970
        1287.,-2091., -366., 1278.,  251.,  838., -196.,  952., # 1970
         800.,  167.,  461., -266., -395.,   26.,  234., -279., # 1970
        -216.,  359.,   26.,  262.,  139.,  -42., -139., -160., # 1970
         -91.,  -56.,   83.,   43.,   64.,  -12.,   15.,  100., # 1970
        -212.,   72.,    2.,  -37.,    3.,   -6., -112.,    1., # 1970
          72.,  -57.,  -70.,    1.,  -27.,   14.,   -4.,  -22., # 1970
           8.,   -2.,   23.,   13.,  -23.,   -2.,  -11.,   14., # 1970
           6.,    7.,   -2.,  -15.,  -13.,    6.,   -3.,  -17., # 1970
           5.,    6.,    0.,   21.,   11.,   -6.,    3.,  -16., # 1970
           8.,   10.,  -21.,    2.,   16.,  -12.,    6.,   10., # 1970
          -4.,   -1.,   -5.,    0.,   10.,    3.,   11.,    1., # 1970
          -2.,   -1.,    1.,   -3.,   -3.,    1.,    2.,    1., # 1970
          -5.,    3.,   -1.,    4.,    6.,   -4.,    4.,    0., # 1970
           1.,   -1.,    0.,    3.,    3.,    1.,   -1.,   -4., # 1970
      -30100.,-2013., 5675.,-1902., 3010.,-2067., 1632.,  -68., # 1975
        1276.,-2144., -333., 1260.,  262.,  830., -223.,  946., # 1975
         791.,  191.,  438., -265., -405.,   39.,  216., -288., # 1975
        -218.,  356.,   31.,  264.,  148.,  -59., -152., -159., # 1975
         -83.,  -49.,   88.,   45.,   66.,  -13.,   28.,   99., # 1975
        -198.,   75.,    1.,  -41.,    6.,   -4., -111.,   11., # 1975
          71.,  -56.,  -77.,    1.,  -26.,   16.,   -5.,  -14., # 1975
          10.,    0.,   22.,   12.,  -23.,   -5.,  -12.,   14., # 1975
           6.,    6.,   -1.,  -16.,  -12.,    4.,   -8.,  -19., # 1975
           4.,    6.,    0.,   18.,   10.,  -10.,    1.,  -17., # 1975
           7.,   10.,  -21.,    2.,   16.,  -12.,    7.,   10., # 1975
          -4.,   -1.,   -5.,   -1.,   10.,    4.,   11.,    1., # 1975
          -3.,   -2.,    1.,   -3.,   -3.,    1.,    2.,    1., # 1975
          -5.,    3.,   -2.,    4.,    5.,   -4.,    4.,   -1., # 1975
           1.,   -1.,    0.,    3.,    3.,    1.,   -1.,   -5., # 1975
      -29992.,-1956., 5604.,-1997., 3027.,-2129., 1663., -200., # 1980
        1281.,-2180., -336., 1251.,  271.,  833., -252.,  938., # 1980
         782.,  212.,  398., -257., -419.,   53.,  199., -297., # 1980
        -218.,  357.,   46.,  261.,  150.,  -74., -151., -162., # 1980
         -78.,  -48.,   92.,   48.,   66.,  -15.,   42.,   93., # 1980
        -192.,   71.,    4.,  -43.,   14.,   -2., -108.,   17., # 1980
          72.,  -59.,  -82.,    2.,  -27.,   21.,   -5.,  -12., # 1980
          16.,    1.,   18.,   11.,  -23.,   -2.,  -10.,   18., # 1980
           6.,    7.,    0.,  -18.,  -11.,    4.,   -7.,  -22., # 1980
           4.,    9.,    3.,   16.,    6.,  -13.,   -1.,  -15., # 1980
           5.,   10.,  -21.,    1.,   16.,  -12.,    9.,    9., # 1980
          -5.,   -3.,   -6.,   -1.,    9.,    7.,   10.,    2., # 1980
          -6.,   -5.,    2.,   -4.,   -4.,    1.,    2.,    0., # 1980
          -5.,    3.,   -2.,    6.,    5.,   -4.,    3.,    0., # 1980
           1.,   -1.,    2.,    4.,    3.,    0.,    0.,   -6., # 1980
      -29873.,-1905., 5500.,-2072., 3044.,-2197., 1687., -306., # 1985
        1296.,-2208., -310., 1247.,  284.,  829., -297.,  936., # 1985
         780.,  232.,  361., -249., -424.,   69.,  170., -297., # 1985
        -214.,  355.,   47.,  253.,  150.,  -93., -154., -164., # 1985
         -75.,  -46.,   95.,   53.,   65.,  -16.,   51.,   88., # 1985
        -185.,   69.,    4.,  -48.,   16.,   -1., -102.,   21., # 1985
          74.,  -62.,  -83.,    3.,  -27.,   24.,   -2.,   -6., # 1985
          20.,    4.,   17.,   10.,  -23.,    0.,   -7.,   21., # 1985
           6.,    8.,    0.,  -19.,  -11.,    5.,   -9.,  -23., # 1985
           4.,   11.,    4.,   14.,    4.,  -15.,   -4.,  -11., # 1985
           5.,   10.,  -21.,    1.,   15.,  -12.,    9.,    9., # 1985
          -6.,   -3.,   -6.,   -1.,    9.,    7.,    9.,    1., # 1985
          -7.,   -5.,    2.,   -4.,   -4.,    1.,    3.,    0., # 1985
          -5.,    3.,   -2.,    6.,    5.,   -4.,    3.,    0., # 1985
           1.,   -1.,    2.,    4.,    3.,    0.,    0.,   -6., # 1985
      -29775.,-1848., 5406.,-2131., 3059.,-2279., 1686., -373., # 1990
        1314.,-2239., -284., 1248.,  293.,  802., -352.,  939., # 1990
         780.,  247.,  325., -240., -423.,   84.,  141., -299., # 1990
        -214.,  353.,   46.,  245.,  154., -109., -153., -165., # 1990
         -69.,  -36.,   97.,   61.,   65.,  -16.,   59.,   82., # 1990
        -178.,   69.,    3.,  -52.,   18.,    1.,  -96.,   24., # 1990
          77.,  -64.,  -80.,    2.,  -26.,   26.,    0.,   -1., # 1990
          21.,    5.,   17.,    9.,  -23.,    0.,   -4.,   23., # 1990
           5.,   10.,   -1.,  -19.,  -10.,    6.,  -12.,  -22., # 1990
           3.,   12.,    4.,   12.,    2.,  -16.,   -6.,  -10., # 1990
           4.,    9.,  -20.,    1.,   15.,  -12.,   11.,    9., # 1990
          -7.,   -4.,   -7.,   -2.,    9.,    7.,    8.,    1., # 1990
          -7.,   -6.,    2.,   -3.,   -4.,    2.,    2.,    1., # 1990
          -5.,    3.,   -2.,    6.,    4.,   -4.,    3.,    0., # 1990
           1.,   -2.,    3.,    3.,    3.,   -1.,    0.,   -6., # 1990
      -29692.,-1784., 5306.,-2200., 3070.,-2366., 1681., -413., # 1995
        1335.,-2267., -262., 1249.,  302.,  759., -427.,  940., # 1995
         780.,  262.,  290., -236., -418.,   97.,  122., -306., # 1995
        -214.,  352.,   46.,  235.,  165., -118., -143., -166., # 1995
         -55.,  -17.,  107.,   68.,   67.,  -17.,   68.,   72., # 1995
        -170.,   67.,   -1.,  -58.,   19.,    1.,  -93.,   36., # 1995
          77.,  -72.,  -69.,    1.,  -25.,   28.,    4.,    5., # 1995
          24.,    4.,   17.,    8.,  -24.,   -2.,   -6.,   25., # 1995
           6.,   11.,   -6.,  -21.,   -9.,    8.,  -14.,  -23., # 1995
           9.,   15.,    6.,   11.,   -5.,  -16.,   -7.,   -4., # 1995
           4.,    9.,  -20.,    3.,   15.,  -10.,   12.,    8., # 1995
          -6.,   -8.,   -8.,   -1.,    8.,   10.,    5.,   -2., # 1995
          -8.,   -8.,    3.,   -3.,   -6.,    1.,    2.,    0., # 1995
          -4.,    4.,   -1.,    5.,    4.,   -5.,    2.,   -1., # 1995
           2.,   -2.,    5.,    1.,    1.,   -2.,    0.,   -7., # 1995
                                zeros(75)...,                   # 1995
      -29619.4,-1728.2, 5186.1,-2267.7, 3068.4,-2481.6, 1670.9, # 2000
        -458.0, 1339.6,-2288.0, -227.6, 1252.1,  293.4,  714.5, # 2000
        -491.1,  932.3,  786.8,  272.6,  250.0, -231.9, -403.0, # 2000
         119.8,  111.3, -303.8, -218.8,  351.4,   43.8,  222.3, # 2000
         171.9, -130.4, -133.1, -168.6,  -39.3,  -12.9,  106.3, # 2000
          72.3,   68.2,  -17.4,   74.2,   63.7, -160.9,   65.1, # 2000
          -5.9,  -61.2,   16.9,    0.7,  -90.4,   43.8,   79.0, # 2000
         -74.0,  -64.6,    0.0,  -24.2,   33.3,    6.2,    9.1, # 2000
          24.0,    6.9,   14.8,    7.3,  -25.4,   -1.2,   -5.8, # 2000
          24.4,    6.6,   11.9,   -9.2,  -21.5,   -7.9,    8.5, # 2000
         -16.6,  -21.5,    9.1,   15.5,    7.0,    8.9,   -7.9, # 2000
         -14.9,   -7.0,   -2.1,    5.0,    9.4,  -19.7,    3.0, # 2000
          13.4,   -8.4,   12.5,    6.3,   -6.2,   -8.9,   -8.4, # 2000
          -1.5,    8.4,    9.3,    3.8,   -4.3,   -8.2,   -8.2, # 2000
           4.8,   -2.6,   -6.0,    1.7,    1.7,    0.0,   -3.1, # 2000
           4.0,   -0.5,    4.9,    3.7,   -5.9,    1.0,   -1.2, # 2000
           2.0,   -2.9,    4.2,    0.2,    0.3,   -2.2,   -1.1, # 2000
          -7.4,    2.7,   -1.7,    0.1,   -1.9,    1.3,    1.5, # 2000
          -0.9,   -0.1,   -2.6,    0.1,    0.9,   -0.7,   -0.7, # 2000
           0.7,   -2.8,    1.7,   -0.9,    0.1,   -1.2,    1.2, # 2000
          -1.9,    4.0,   -0.9,   -2.2,   -0.3,   -0.4,    0.2, # 2000
           0.3,    0.9,    2.5,   -0.2,   -2.6,    0.9,    0.7, # 2000
          -0.5,    0.3,    0.3,    0.0,   -0.3,    0.0,   -0.4, # 2000
           0.3,   -0.1,   -0.9,   -0.2,   -0.4,   -0.4,    0.8, # 2000
          -0.2,   -0.9,   -0.9,    0.3,    0.2,    0.1,    1.8, # 2000
          -0.4,   -0.4,    1.3,   -1.0,   -0.4,   -0.1,    0.7, # 2000
           0.7,   -0.4,    0.3,    0.3,    0.6,   -0.1,    0.3, # 2000
           0.4,   -0.2,    0.0,   -0.5,    0.1,   -0.9,         # 2000
     -29554.63,-1669.05, 5077.99,-2337.24, 3047.69,-2594.50,    # 2005
       1657.76, -515.43, 1336.30,-2305.83, -198.86, 1246.39,    # 2005
        269.72,  672.51, -524.72,  920.55,  797.96,  282.07,    # 2005
        210.65, -225.23, -379.86,  145.15,  100.00, -305.36,    # 2005
       -227.00,  354.41,   42.72,  208.95,  180.25, -136.54,    # 2005
       -123.45, -168.05,  -19.57,  -13.55,  103.85,   73.60,    # 2005
         69.56,  -20.33,   76.74,   54.75, -151.34,   63.63,    # 2005
        -14.58,  -63.53,   14.58,    0.24,  -86.36,   50.94,    # 2005
         79.88,  -74.46,  -61.14,   -1.65,  -22.57,   38.73,    # 2005
          6.82,   12.30,   25.35,    9.37,   10.93,    5.42,    # 2005
        -26.32,    1.94,   -4.64,   24.80,    7.62,   11.20,    # 2005
        -11.73,  -20.88,   -6.88,    9.83,  -18.11,  -19.71,    # 2005
         10.17,   16.22,    9.36,    7.61,  -11.25,  -12.76,    # 2005
         -4.87,   -0.06,    5.58,    9.76,  -20.11,    3.58,    # 2005
         12.69,   -6.94,   12.67,    5.01,   -6.72,  -10.76,    # 2005
         -8.16,   -1.25,    8.10,    8.76,    2.92,   -6.66,    # 2005
         -7.73,   -9.22,    6.01,   -2.17,   -6.12,    2.19,    # 2005
          1.42,    0.10,   -2.35,    4.46,   -0.15,    4.76,    # 2005
          3.06,   -6.58,    0.29,   -1.01,    2.06,   -3.47,    # 2005
          3.77,   -0.86,   -0.21,   -2.31,   -2.09,   -7.93,    # 2005
          2.95,   -1.60,    0.26,   -1.88,    1.44,    1.44,    # 2005
         -0.77,   -0.31,   -2.27,    0.29,    0.90,   -0.79,    # 2005
         -0.58,    0.53,   -2.69,    1.80,   -1.08,    0.16,    # 2005
         -1.58,    0.96,   -1.90,    3.99,   -1.39,   -2.15,    # 2005
         -0.29,   -0.55,    0.21,    0.23,    0.89,    2.38,    # 2005
         -0.38,   -2.63,    0.96,    0.61,   -0.30,    0.40,    # 2005
          0.46,    0.01,   -0.35,    0.02,   -0.36,    0.28,    # 2005
          0.08,   -0.87,   -0.49,   -0.34,   -0.08,    0.88,    # 2005
         -0.16,   -0.88,   -0.76,    0.30,    0.33,    0.28,    # 2005
          1.72,   -0.43,   -0.54,    1.18,   -1.07,   -0.37,    # 2005
         -0.04,    0.75,    0.63,   -0.26,    0.21,    0.35,    # 2005
          0.53,   -0.05,    0.38,    0.41,   -0.22,   -0.10,    # 2005
         -0.57,   -0.18,   -0.82,                               # 2005
     -29496.57,-1586.42, 4944.26,-2396.06, 3026.34,-2708.54,    # 2010
       1668.17, -575.73, 1339.85,-2326.54, -160.40, 1232.10,    # 2010
        251.75,  633.73, -537.03,  912.66,  808.97,  286.48,    # 2010
        166.58, -211.03, -356.83,  164.46,   89.40, -309.72,    # 2010
       -230.87,  357.29,   44.58,  200.26,  189.01, -141.05,    # 2010
       -118.06, -163.17,   -0.01,   -8.03,  101.04,   72.78,    # 2010
         68.69,  -20.90,   75.92,   44.18, -141.40,   61.54,    # 2010
        -22.83,  -66.26,   13.10,    3.02,  -78.09,   55.40,    # 2010
         80.44,  -75.00,  -57.80,   -4.55,  -21.20,   45.24,    # 2010
          6.54,   14.00,   24.96,   10.46,    7.03,    1.64,    # 2010
        -27.61,    4.92,   -3.28,   24.41,    8.21,   10.84,    # 2010
        -14.50,  -20.03,   -5.59,   11.83,  -19.34,  -17.41,    # 2010
         11.61,   16.71,   10.85,    6.96,  -14.05,  -10.74,    # 2010
         -3.54,    1.64,    5.50,    9.45,  -20.54,    3.45,    # 2010
         11.51,   -5.27,   12.75,    3.13,   -7.14,  -12.38,    # 2010
         -7.42,   -0.76,    7.97,    8.43,    2.14,   -8.42,    # 2010
         -6.08,  -10.08,    7.01,   -1.94,   -6.24,    2.73,    # 2010
          0.89,   -0.10,   -1.07,    4.71,   -0.16,    4.44,    # 2010
          2.45,   -7.22,   -0.33,   -0.96,    2.13,   -3.95,    # 2010
          3.09,   -1.99,   -1.03,   -1.97,   -2.80,   -8.31,    # 2010
          3.05,   -1.48,    0.13,   -2.03,    1.67,    1.65,    # 2010
         -0.66,   -0.51,   -1.76,    0.54,    0.85,   -0.79,    # 2010
         -0.39,    0.37,   -2.51,    1.79,   -1.27,    0.12,    # 2010
         -2.11,    0.75,   -1.94,    3.75,   -1.86,   -2.12,    # 2010
         -0.21,   -0.87,    0.30,    0.27,    1.04,    2.13,    # 2010
         -0.63,   -2.49,    0.95,    0.49,   -0.11,    0.59,    # 2010
          0.52,    0.00,   -0.39,    0.13,   -0.37,    0.27,    # 2010
          0.21,   -0.86,   -0.77,   -0.23,    0.04,    0.87,    # 2010
         -0.09,   -0.89,   -0.87,    0.31,    0.30,    0.42,    # 2010
          1.66,   -0.45,   -0.59,    1.08,   -1.14,   -0.31,    # 2010
         -0.07,    0.78,    0.54,   -0.18,    0.10,    0.38,    # 2010
          0.49,    0.02,    0.44,    0.42,   -0.25,   -0.26,    # 2010
         -0.53,   -0.26,   -0.79,                               # 2010
     -29442.0,-1501.0, 4797.1,-2445.1, 3012.9,-2845.6, 1676.7,  # 2015
       -641.9, 1350.7,-2352.3, -115.3, 1225.6,  244.9,  582.0,  # 2015
       -538.4,  907.6,  813.7,  283.3,  120.4, -188.7, -334.9,  # 2015
        180.9,   70.4, -329.5, -232.6,  360.1,   47.3,  192.4,  # 2015
        197.0, -140.9, -119.3, -157.5,   16.0,    4.1,  100.2,  # 2015
         70.0,   67.7,  -20.8,   72.7,   33.2, -129.9,   58.9,  # 2015
        -28.9,  -66.7,   13.2,    7.3,  -70.9,   62.6,   81.6,  # 2015
        -76.1,  -54.1,   -6.8,  -19.5,   51.8,    5.7,   15.0,  # 2015
         24.4,    9.4,    3.4,   -2.8,  -27.4,    6.8,   -2.2,  # 2015
         24.2,    8.8,   10.1,  -16.9,  -18.3,   -3.2,   13.3,  # 2015
        -20.6,  -14.6,   13.4,   16.2,   11.7,    5.7,  -15.9,  # 2015
         -9.1,   -2.0,    2.1,    5.4,    8.8,  -21.6,    3.1,  # 2015
         10.8,   -3.3,   11.8,    0.7,   -6.8,  -13.3,   -6.9,  # 2015
         -0.1,    7.8,    8.7,    1.0,   -9.1,   -4.0,  -10.5,  # 2015
          8.4,   -1.9,   -6.3,    3.2,    0.1,   -0.4,    0.5,  # 2015
          4.6,   -0.5,    4.4,    1.8,   -7.9,   -0.7,   -0.6,  # 2015
          2.1,   -4.2,    2.4,   -2.8,   -1.8,   -1.2,   -3.6,  # 2015
         -8.7,    3.1,   -1.5,   -0.1,   -2.3,    2.0,    2.0,  # 2015
         -0.7,   -0.8,   -1.1,    0.6,    0.8,   -0.7,   -0.2,  # 2015
          0.2,   -2.2,    1.7,   -1.4,   -0.2,   -2.5,    0.4,  # 2015
         -2.0,    3.5,   -2.4,   -1.9,   -0.2,   -1.1,    0.4,  # 2015
          0.4,    1.2,    1.9,   -0.8,   -2.2,    0.9,    0.3,  # 2015
          0.1,    0.7,    0.5,   -0.1,   -0.3,    0.3,   -0.4,  # 2015
          0.2,    0.2,   -0.9,   -0.9,   -0.1,    0.0,    0.7,  # 2015
          0.0,   -0.9,   -0.9,    0.4,    0.4,    0.5,    1.6,  # 2015
         -0.5,   -0.5,    1.0,   -1.2,   -0.2,   -0.1,    0.8,  # 2015
          0.4,   -0.1,   -0.1,    0.3,    0.4,    0.1,    0.5,  # 2015
          0.5,   -0.3,   -0.4,   -0.4,   -0.3,   -0.8,          # 2015
         10.3,   18.1,  -26.6,   -8.7,   -3.3,  -27.4,    2.1,  # 2017
        -14.1,    3.4,   -5.5,    8.2,   -0.7,   -0.4,  -10.1,  # 2017
          1.8,   -0.7,    0.2,   -1.3,   -9.1,    5.3,    4.1,  # 2017
          2.9,   -4.3,   -5.2,   -0.2,    0.5,    0.6,   -1.3,  # 2017
          1.7,   -0.1,   -1.2,    1.4,    3.4,    3.9,    0.0,  # 2017
         -0.3,   -0.1,    0.0,   -0.7,   -2.1,    2.1,   -0.7,  # 2017
         -1.2,    0.2,    0.3,    0.9,    1.6,    1.0,    0.3,  # 2017
         -0.2,    0.8,   -0.5,    0.4,    1.3,   -0.2,    0.1,  # 2017
         -0.3,   -0.6,   -0.6,   -0.8,    0.1,    0.2,   -0.2,  # 2017
          0.2,    0.0,   -0.3,   -0.6,    0.3,    0.5,    0.1,  # 2017
         -0.2,    0.5,    0.4,   -0.2,    0.1,   -0.3,   -0.4,  # 2017
          0.3,    0.3,    0.0, zeros(115)...                    # 2017
         ]