#== # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Description
#
#   Functions to compute the nutation according to IAU-76/FK5.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# References
#
#   [1] Vallado, D. A (2013). Fundamentals of Astrodynamics and Applications.
#       Microcosm Press, Hawthorn, CA, USA.
#
#   [2] Vallado, D. A (06-Feb-2018). Consolidated Errata of Fundamentals of
#       Astrodynamics and Applications 4th Ed.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # ==#

export nutation_fk5

################################################################################
#                                  Constants
################################################################################

################################################################################
#
# 1980 IAU Theory of Nutation Coefficients
# ========================================
#
# Those coefficients can be found on:
#
#   Seidelmann, P. K. 1980 IAU theory of nutation - The final report of the IAU
#   Working Group on Nutation. Celestial Mechanics, vol. 27, p. 79-106.
#
# However, the .dat file that was used to create this matrix was obtained from
# this website:
#
#   http://hpiers.obspm.fr/eop-pc/models/nutations/nut.html
#
# Notice that the order of them is not equal to that presented in the original
# paper, but this have no impact when computing the nutation. Moreover, this is
# the same order that is presented in [1, p. 1043].
#
################################################################################

const nut_coefs_1980 = [
  # Notation used in [1, p. 226].
  #
  # an1  an2  an3  an4  an5        Ai            Bi         Ci            Di
  #                  Units:  [0.0001"]  [0.0001"/JC]  [0.0001"]  [0.0001"/JC]
      0    0    0    0    1  -171996.0       -174.2    92025.0           8.9;
      0    0    2   -2    2   -13187.0         -1.6     5736.0          -3.1;
      0    0    2    0    2    -2274.0         -0.2      977.0          -0.5;
      0    0    0    0    2     2062.0          0.2     -895.0           0.5;
      0   -1    0    0    0    -1426.0          3.4       54.0          -0.1;
      1    0    0    0    0      712.0          0.1       -7.0           0.0;
      0    1    2   -2    2     -517.0          1.2      224.0          -0.6;
      0    0    2    0    1     -386.0         -0.4      200.0           0.0;
      1    0    2    0    2     -301.0          0.0      129.0          -0.1;
      0   -1    2   -2    2      217.0         -0.5      -95.0           0.3;
     -1    0    0    2    0      158.0          0.0       -1.0           0.0;
      0    0    2   -2    1      129.0          0.1      -70.0           0.0;
     -1    0    2    0    2      123.0          0.0      -53.0           0.0;
      1    0    0    0    1       63.0          0.1      -33.0           0.0;
      0    0    0    2    0       63.0          0.0       -2.0           0.0;
     -1    0    2    2    2      -59.0          0.0       26.0           0.0;
     -1    0    0    0    1      -58.0         -0.1       32.0           0.0;
      1    0    2    0    1      -51.0          0.0       27.0           0.0;
     -2    0    0    2    0      -48.0          0.0        1.0           0.0;
     -2    0    2    0    1       46.0          0.0      -24.0           0.0;
      0    0    2    2    2      -38.0          0.0       16.0           0.0;
      2    0    2    0    2      -31.0          0.0       13.0           0.0;
      2    0    0    0    0       29.0          0.0       -1.0           0.0;
      1    0    2   -2    2       29.0          0.0      -12.0           0.0;
      0    0    2    0    0       26.0          0.0       -1.0           0.0;
      0    0    2   -2    0      -22.0          0.0        0.0           0.0;
     -1    0    2    0    1       21.0          0.0      -10.0           0.0;
      0    2    0    0    0       17.0         -0.1        0.0           0.0;
      0    2    2   -2    2      -16.0          0.1        7.0           0.0;
     -1    0    0    2    1       16.0          0.0       -8.0           0.0;
      0    1    0    0    1      -15.0          0.0        9.0           0.0;
      1    0    0   -2    1      -13.0          0.0        7.0           0.0;
      0   -1    0    0    1      -12.0          0.0        6.0           0.0;
      2    0   -2    0    0       11.0          0.0        0.0           0.0;
     -1    0    2    2    1      -10.0          0.0        5.0           0.0;
      1    0    2    2    2       -8.0          0.0        3.0           0.0;
      0   -1    2    0    2       -7.0          0.0        3.0           0.0;
      0    0    2    2    1       -7.0          0.0        3.0           0.0;
      1    1    0   -2    0       -7.0          0.0        0.0           0.0;
      0    1    2    0    2        7.0          0.0       -3.0           0.0;
     -2    0    0    2    1       -6.0          0.0        3.0           0.0;
      0    0    0    2    1       -6.0          0.0        3.0           0.0;
      2    0    2   -2    2        6.0          0.0       -3.0           0.0;
      1    0    0    2    0        6.0          0.0        0.0           0.0;
      1    0    2   -2    1        6.0          0.0       -3.0           0.0;
      0    0    0   -2    1       -5.0          0.0        3.0           0.0;
      0   -1    2   -2    1       -5.0          0.0        3.0           0.0;
      2    0    2    0    1       -5.0          0.0        3.0           0.0;
      1   -1    0    0    0        5.0          0.0        0.0           0.0;
      1    0    0   -1    0       -4.0          0.0        0.0           0.0;
      0    0    0    1    0       -4.0          0.0        0.0           0.0;
      0    1    0   -2    0       -4.0          0.0        0.0           0.0;
      1    0   -2    0    0        4.0          0.0        0.0           0.0;
      2    0    0   -2    1        4.0          0.0       -2.0           0.0;
      0    1    2   -2    1        4.0          0.0       -2.0           0.0;
      1    1    0    0    0       -3.0          0.0        0.0           0.0;
      1   -1    0   -1    0       -3.0          0.0        0.0           0.0;
     -1   -1    2    2    2       -3.0          0.0        1.0           0.0;
      0   -1    2    2    2       -3.0          0.0        1.0           0.0;
      1   -1    2    0    2       -3.0          0.0        1.0           0.0;
      3    0    2    0    2       -3.0          0.0        1.0           0.0;
     -2    0    2    0    2       -3.0          0.0        1.0           0.0;
      1    0    2    0    0        3.0          0.0        0.0           0.0;
     -1    0    2    4    2       -2.0          0.0        1.0           0.0;
      1    0    0    0    2       -2.0          0.0        1.0           0.0;
     -1    0    2   -2    1       -2.0          0.0        1.0           0.0;
      0   -2    2   -2    1       -2.0          0.0        1.0           0.0;
     -2    0    0    0    1       -2.0          0.0        1.0           0.0;
      2    0    0    0    1        2.0          0.0       -1.0           0.0;
      3    0    0    0    0        2.0          0.0        0.0           0.0;
      1    1    2    0    2        2.0          0.0       -1.0           0.0;
      0    0    2    1    2        2.0          0.0       -1.0           0.0;
      1    0    0    2    1       -1.0          0.0        0.0           0.0;
      1    0    2    2    1       -1.0          0.0        1.0           0.0;
      1    1    0   -2    1       -1.0          0.0        0.0           0.0;
      0    1    0    2    0       -1.0          0.0        0.0           0.0;
      0    1    2   -2    0       -1.0          0.0        0.0           0.0;
      0    1   -2    2    0       -1.0          0.0        0.0           0.0;
      1    0   -2    2    0       -1.0          0.0        0.0           0.0;
      1    0   -2   -2    0       -1.0          0.0        0.0           0.0;
      1    0    2   -2    0       -1.0          0.0        0.0           0.0;
      1    0    0   -4    0       -1.0          0.0        0.0           0.0;
      2    0    0   -4    0       -1.0          0.0        0.0           0.0;
      0    0    2    4    2       -1.0          0.0        0.0           0.0;
      0    0    2   -1    2       -1.0          0.0        0.0           0.0;
     -2    0    2    4    2       -1.0          0.0        1.0           0.0;
      2    0    2    2    2       -1.0          0.0        0.0           0.0;
      0   -1    2    0    1       -1.0          0.0        0.0           0.0;
      0    0   -2    0    1       -1.0          0.0        0.0           0.0;
      0    0    4   -2    2        1.0          0.0        0.0           0.0;
      0    1    0    0    2        1.0          0.0        0.0           0.0;
      1    1    2   -2    2        1.0          0.0       -1.0           0.0;
      3    0    2   -2    2        1.0          0.0        0.0           0.0;
     -2    0    2    2    2        1.0          0.0       -1.0           0.0;
     -1    0    0    0    2        1.0          0.0       -1.0           0.0;
      0    0   -2    2    1        1.0          0.0        0.0           0.0;
      0    1    2    0    1        1.0          0.0        0.0           0.0;
     -1    0    4    0    2        1.0          0.0        0.0           0.0;
      2    1    0   -2    0        1.0          0.0        0.0           0.0;
      2    0    0    2    0        1.0          0.0        0.0           0.0;
      2    0    2   -2    1        1.0          0.0       -1.0           0.0;
      2    0   -2    0    1        1.0          0.0        0.0           0.0;
      1   -1    0   -2    0        1.0          0.0        0.0           0.0;
     -1    0    0    1    1        1.0          0.0        0.0           0.0;
     -1   -1    0    2    1        1.0          0.0        0.0           0.0;
      0    1    0    1    0        1.0          0.0        0.0           0.0;]

################################################################################
#                                  Functions
################################################################################

"""
    function nutation_fk5(JD_TT::Number, n_max::Number = 106, nut_coefs_1980::Matrix = nut_coefs_1980)

Compute the nutation parameters at the Julian Day `JD_TT` [Terrestrial Time]
using the 1980 IAU Theory of Nutation. The coefficients are `nut_coefs_1980`
that must be a matrix in which each line has the following syntax [1, p. 1043]:

    an1  an2  an3  an4  an5  Ai  Bi  Ci  Di

where the units of `Ai` and `Ci` are [0.0001"] and the units of `Bi` and `Di`
are [0.0001"/JC]. The user can also specify the number of coefficients `n_max`
that will be used when computing the nutation. If `n_max` is omitted, the it
defaults to 106.

# Returns

* The mean obliquity of the ecliptic [rad].
* The nutation in obliquity of the ecliptic [rad].
* The nutation in longitude [rad].

"""
function nutation_fk5(JD_TT::Number, n_max::Number = 106, nut_coefs_1980::Matrix = nut_coefs_1980)
    # Compute the Julian Centuries from `JD_TT`.
    T_TT = (JD_TT - JD_J2000)/36525

    # Mean obliquity of the ecliptic
    # ==============================

    # Compute the mean obliquity of the ecliptic [s].
    mϵ_1980 = 23.439291 - 0.0130042*T_TT - 1.64e-7*T_TT^2 + 5.04e-7*T_TT^3

    # Reduce to the interval [0, 2π]°.
    mϵ_1980 = mod(mϵ_1980, 360)*pi/180

    # Delaunay parameters of the Sun and Moon
    # =======================================

    # Evaluate the Delaunay parameters associated with the Moon and the Sun
    # in the interval [0,2π]°.
    #
    # The parameters here were updated as stated in the errata [2].
    r = 360

    M_m = 134.96298139 + (1325r + 198.8673981)*T_TT +
                         0.0086972*T_TT^2 +
                         1.78e-5*T_TT^3
    M_m = mod(M_m, 360)*pi/180

    M_s = 357.52772333 + (99r + 359.0503400)*T_TT -
                         0.0001603*T_TT^2 -
                         3.3e-6*T_TT^3
    M_s = mod(M_s, 360)*pi/180

    u_Mm = 93.27191028 + (1342r + 82.0175381)*T_TT -
                         0.0036825*T_TT^2 +
                         3.1e-6*T_TT^3
    u_Mm = mod(u_Mm, 360)*pi/180

    D_s = 297.85036306 + (1236r + 307.1114800)*T_TT -
                         0.0019142*T_TT^2 +
                         5.3e-6*T_TT^3
    D_s = mod(D_s, 360)*pi/180

    Ω_m = 125.04452222 - (5r + 134.1362608)*T_TT +
                         0.0020708*T_TT^2 +
                         2.2e-6*T_TT^3
    Ω_m = mod(Ω_m, 360)*pi/180

    # Nutation in longitude and obliquity
    # ===================================

    # Compute the nutation in the longitude and in obliquity.
    ΔΨ_1980 = 0.0
    Δϵ_1980 = 0.0

    for i = 1:n_max
        # Unpack values.
        an1, an2, an3, an4, an5, Ai, Bi, Ci, Di = nut_coefs_1980[i,:]

        a_pi = an1*M_m + an2*M_s + an3*u_Mm + an4*D_s + an5*Ω_m

        ΔΨ_1980 += (Ai + Bi*T_TT)*sin(a_pi)
        Δϵ_1980 += (Ci + Di*T_TT)*cos(a_pi)
    end

    # The nutation coefficients in `nut_coefs_1980` lead to angles with unit
    # 0.0001". Hence, we must convert to [rad].
    ΔΨ_1980 *= 0.0001/3600*pi/180
    Δϵ_1980 *= 0.0001/3600*pi/180

    # Return the values.
    (mϵ_1980, Δϵ_1980, ΔΨ_1980)
end
