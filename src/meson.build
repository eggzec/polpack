
add_languages('fortran')

py_mod = import('python')
py = py_mod.find_installation(pure: false)
py_dep = py.dependency()

f2py = [py, '-m', 'numpy.f2py']

incdir_numpy = run_command(py,
  ['-c', 'import numpy; print(numpy.get_include())'],
  check: true
).stdout().strip()

incdir_f2py = run_command(py,
  ['-c', 'import numpy.f2py; print(numpy.f2py.get_include())'],
  check: true
).stdout().strip()

fortranobject_c = run_command(py,
  ['-c', 'import numpy.f2py; import os; print(os.path.join(numpy.f2py.get_include(), "fortranobject.c"))'],
  check: true
).stdout().strip()

py_mod_name = '_polpack'

fortran_sources = [
  'agm_values.f',
  'agud.f',
  'align_enum.f',
  'bell.f',
  'bell_values.f',
  'benford.f',
  'bernoulli_number.f',
  'bernoulli_number2.f',
  'bernoulli_number3.f',
  'bernoulli_number_values.f',
  'bernoulli_poly.f',
  'bernoulli_poly2.f',
  'bernstein_poly.f',
  'bernstein_poly_values.f',
  'beta_values.f',
  'bpab.f',
  'cardan_poly.f',
  'cardan_poly_coef.f',
  'cardinal_cos.f',
  'cardinal_sin.f',
  'catalan.f',
  'catalan_constant.f',
  'catalan_row_next.f',
  'catalan_values.f',
  'charlier.f',
  'cheby_t_poly.f',
  'cheby_t_poly_coef.f',
  'cheby_t_poly_values.f',
  'cheby_t_poly_zero.f',
  'cheby_u_poly.f',
  'cheby_u_poly_coef.f',
  'cheby_u_poly_values.f',
  'cheby_u_poly_zero.f',
  'chebyshev_discrete.f',
  'collatz_count.f',
  'collatz_count_max.f',
  'collatz_count_values.f',
  'comb_row_next.f',
  'commul.f',
  'complete_symmetric_poly.f',
  'cos_power_int.f',
  'cos_power_int_values.f',
  'delannoy.f',
  'erf_values.f',
  'euler_number.f',
  'euler_number2.f',
  'euler_number_values.f',
  'euler_poly.f',
  'eulerian.f',
  'fibonacci_direct.f',
  'fibonacci_floor.f',
  'fibonacci_recursive.f',
  'gamma_log_values.f',
  'gamma_values.f',
  'gegenbauer_poly.f',
  'gegenbauer_poly_values.f',
  'gen_hermite_poly.f',
  'gen_laguerre_poly.f',
  'gud.f',
  'gud_values.f',
  'hermite_poly_phys.f',
  'hermite_poly_phys_coef.f',
  'hermite_poly_phys_values.f',
  'hyper_2f1_values.f',
  'i4_choose.f',
  'i4_factor.f',
  'i4_factorial.f',
  'i4_factorial_values.f',
  'i4_factorial2.f',
  'i4_factorial2_values.f',
  'i4_huge.f',
  'i4_is_prime.f',
  'i4_is_triangular.f',
  'i4_partition_distinct_count.f',
  'i4_swap.f',
  'i4_to_triangle_lower.f',
  'i4_to_triangle_upper.f',
  'i4_uniform_ab.f',
  'i4mat_print.f',
  'i4mat_print_some.f',
  'jacobi_poly.f',
  'jacobi_poly_values.f',
  'jacobi_symbol.f',
  'krawtchouk.f',
  'laguerre_associated.f',
  'laguerre_poly.f',
  'laguerre_poly_coef.f',
  'laguerre_polynomial_values.f',
  'lambert_w.f',
  'lambert_w_crude.f',
  'lambert_w_values.f',
  'legendre_associated.f',
  'legendre_associated_normalized.f',
  'legendre_associated_normalized_sphere_values.f',
  'legendre_associated_values.f',
  'legendre_function_q.f',
  'legendre_function_q_values.f',
  'legendre_poly.f',
  'legendre_poly_coef.f',
  'legendre_poly_values.f',
  'legendre_symbol.f',
  'lerch.f',
  'lerch_values.f',
  'lock.f',
  'meixner.f',
  'mertens.f',
  'mertens_values.f',
  'moebius.f',
  'moebius_values.f',
  'motzkin.f',
  'normal_01_cdf_inverse.f',
  'normal_01_cdf_values.f',
  'omega.f',
  'omega_values.f',
  'partition_distinct_count_values.f',
  'pentagon_num.f',
  'phi.f',
  'phi_values.f',
  'plane_partition_num.f',
  'poly_bernoulli.f',
  'poly_coef_count.f',
  'prime.f',
  'psi_values.f',
  'pyramid_num.f',
  'pyramid_square_num.f',
  'r8_agm.f',
  'r8_beta.f',
  'r8_choose.f',
  'r8_epsilon.f',
  'r8_erf.f',
  'r8_erf_inverse.f',
  'r8_euler_constant.f',
  'r8_factorial.f',
  'r8_factorial_log.f',
  'r8_factorial_log_values.f',
  'r8_factorial_values.f',
  'r8_gamma_log.f',
  'r8_huge.f',
  'r8_hyper_2f1.f',
  'r8_mop.f',
  'r8_nint.f',
  'r8_pi.f',
  'r8_psi.f',
  'r8_uniform_01.f',
  'r8poly_degree.f',
  'r8poly_print.f',
  'r8poly_value_horner.f',
  'r8vec_linspace.f',
  'r8vec_print.f',
  'r8vec_print_some.f',
  'r8vec_uniform_ab.f',
  's_len_trim.f',
  'sigma.f',
  'sigma_values.f',
  'simplex_num.f',
  'sin_power_int.f',
  'sin_power_int_values.f',
  'slice.f',
  'spherical_harmonic.f',
  'spherical_harmonic_values.f',
  'stirling1.f',
  'stirling2.f',
  'tau.f',
  'tau_values.f',
  'tetrahedron_num.f',
  'timestamp.f',
  'triangle_num.f',
  'triangle_lower_to_i4.f',
  'triangle_upper_to_i4.f',
  'trinomial.f',
  'vibonacci.f',
  'zeckendorf.f',
  'zernike_poly.f',
  'zernike_poly_coef.f',
  'zeta.f',
  'zeta_values.f'
]

pyf_sources = [
  'polpack.pyf'
]

message('Fortran sources: ', fortran_sources + pyf_sources)

f2py_target = custom_target(
  py_mod_name + '_f2py',
  input: pyf_sources,
  output: [py_mod_name + 'module.c', py_mod_name + '-f2pywrappers.f'],
  command: f2py + ['@INPUT@', '--lower', '--build-dir', meson.current_build_dir()]
)


if host_machine.system() == 'windows'
  fortran_link_args = [
    '-static-libgfortran',
    '-static-libgcc',
    '-static-libquadmath',
    '-Wl,-Bstatic',
    '-lwinpthread',
    '-Wl,-Bdynamic',
  ]
else
  fortran_link_args = []
endif

# Install Python package
py.install_sources(
  'polpack/__init__.py',
  subdir: 'polpack'
)

# Build and install extension module inside the package
py.extension_module(
  py_mod_name,
  fortran_sources + [f2py_target, fortranobject_c],
  c_args: ['-I' + incdir_numpy, '-I' + incdir_f2py],
  link_args: fortran_link_args,
  dependencies: py_dep,
  install: true,
  subdir: 'polpack'
)
