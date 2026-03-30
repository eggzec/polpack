      subroutine hyper_2f1_values ( n_data, a, b, c, x, fx )

c*********************************************************************72
c
cc HYPER_2F1_VALUES returns some values of the hypergeometric function 2F1.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      fx = Hypergeometric2F1 [ a, b, c, x ]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    09 September 2007
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    National Bureau of Standards, 1964,
c    ISBN: 0-486-61272-4,
c    LC: QA47.A34.
c
c    Stephen Wolfram,
c    The Mathematica Book,
c    Fourth Edition,
c    Cambridge University Press, 1999,
c    ISBN: 0-521-64314-7,
c    LC: QA76.95.W65.
c
c    Shanjie Zhang, Jianming Jin,
c    Computation of Special Functions,
c    Wiley, 1996,
c    ISBN: 0-471-11963-6,
c    LC: QA351.C45
c
c    Daniel Zwillinger, editor,
c    CRC Standard Mathematical Tables and Formulae,
c    30th Edition,
c    CRC Press, 1996,
c    ISBN: 0-8493-2479-3,
c    LC: QA47.M315.
c
c  Parameters:
c
c    Input/output, integer N_DATA.  The user sets N_DATA to 0 
c    before the first call.  On each call, the routine increments N_DATA by 1,
c    and returns the corresponding data; when there is no more data, the
c    output value of N_DATA will be 0 again.
c
c    Output, double precision A, B, C, X, the parameters.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 24 )

      double precision a
      double precision a_vec(n_max)
      double precision b
      double precision b_vec(n_max)
      double precision c
      double precision c_vec(n_max)
      double precision fx
      double precision fx_vec(n_max)
      integer n_data
      double precision x
      double precision x_vec(n_max)

      save a_vec
      save b_vec
      save c_vec
      save fx_vec
      save x_vec

      data a_vec /
     &   -2.5D+00, 
     &   -0.5D+00, 
     &    0.5D+00, 
     &    2.5D+00, 
     &   -2.5D+00, 
     &   -0.5D+00, 
     &    0.5D+00, 
     &    2.5D+00, 
     &   -2.5D+00, 
     &   -0.5D+00, 
     &    0.5D+00, 
     &    2.5D+00, 
     &    3.3D+00, 
     &    1.1D+00, 
     &    1.1D+00, 
     &    3.3D+00, 
     &    3.3D+00, 
     &    1.1D+00, 
     &    1.1D+00, 
     &    3.3D+00, 
     &    3.3D+00, 
     &    1.1D+00, 
     &    1.1D+00, 
     &    3.3D+00 /
      data b_vec /
     &    3.3D+00, 
     &    1.1D+00, 
     &    1.1D+00, 
     &    3.3D+00, 
     &    3.3D+00, 
     &    1.1D+00, 
     &    1.1D+00, 
     &    3.3D+00, 
     &    3.3D+00, 
     &    1.1D+00, 
     &    1.1D+00, 
     &    3.3D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00 /
      data c_vec /
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &    6.7D+00, 
     &   -5.5D+00, 
     &   -0.5D+00, 
     &    0.5D+00, 
     &    4.5D+00, 
     &   -5.5D+00, 
     &   -0.5D+00, 
     &    0.5D+00, 
     &    4.5D+00, 
     &   -5.5D+00, 
     &   -0.5D+00, 
     &    0.5D+00, 
     &    4.5D+00 /
      data fx_vec /
     &    0.72356129348997784913D+00, 
     &    0.97911109345277961340D+00, 
     &    1.0216578140088564160D+00, 
     &    1.4051563200112126405D+00, 
     &    0.46961431639821611095D+00, 
     &    0.95296194977446325454D+00, 
     &    1.0512814213947987916D+00, 
     &    2.3999062904777858999D+00, 
     &    0.29106095928414718320D+00, 
     &    0.92536967910373175753D+00, 
     &    1.0865504094806997287D+00, 
     &    5.7381565526189046578D+00, 
     &    15090.669748704606754D+00, 
     &   -104.31170067364349677D+00, 
     &    21.175050707768812938D+00, 
     &    4.1946915819031922850D+00, 
     &    1.0170777974048815592D+10, 
     &   -24708.635322489155868D+00, 
     &    1372.2304548384989560D+00, 
     &    58.092728706394652211D+00, 
     &    5.8682087615124176162D+18, 
     &   -4.4635010147295996680D+08, 
     &    5.3835057561295731310D+06, 
     &    20396.913776019659426D+00 /
      data x_vec /
     &    0.25D+00, 
     &    0.25D+00, 
     &    0.25D+00, 
     &    0.25D+00, 
     &    0.55D+00, 
     &    0.55D+00, 
     &    0.55D+00, 
     &    0.55D+00, 
     &    0.85D+00, 
     &    0.85D+00, 
     &    0.85D+00, 
     &    0.85D+00, 
     &    0.25D+00, 
     &    0.25D+00, 
     &    0.25D+00, 
     &    0.25D+00, 
     &    0.55D+00, 
     &    0.55D+00, 
     &    0.55D+00, 
     &    0.55D+00, 
     &    0.85D+00, 
     &    0.85D+00, 
     &    0.85D+00, 
     &    0.85D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if
 
      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        a = 0.0D+00
        b = 0.0D+00
        c = 0.0D+00
        x = 0.0D+00
        fx = 0.0D+00
      else
        a = a_vec(n_data)
        b = b_vec(n_data)
        c = c_vec(n_data)
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
