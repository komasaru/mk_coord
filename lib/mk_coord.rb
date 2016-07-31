require "mk_coord/version"
require "mk_coord/const"
require "mk_coord/matrix"
require "mk_coord/trigonometric"
include MkCoord::Const
include MkCoord::Matrix
include MkCoord::Trigonometric

module MkCoord
  def self.rect_eq2ec(rect_eq, eps)
    mtx = r_x(eps)
    return rotate(mtx, rect_eq)
  rescue => e
    raise
  end

  def self.rect_ec2eq(rect_ec, eps)
    mtx = r_x(-eps)
    return rotate(mtx, rect_ec)
  rescue => e
    raise
  end

  def self.pol_eq2ec(pol_eq, eps)
    lambda = compute_lambda(*pol_eq, eps)
    beta   = compute_beta(*pol_eq, eps)
    return [lambda, beta]
  rescue => e
    raise
  end

  def self.pol_ec2eq(pol_ec, eps)
    alpha = compute_alpha(*pol_ec, eps)
    delta = compute_delta(*pol_ec, eps)
    return [alpha, delta]
  rescue => e
    raise
  end

  def self.rect2pol(rect)
    x, y, z = rect
    r = Math.sqrt(x * x + y * y)
    lambda = Math.atan2(y, x)
    phi    = Math.atan2(z, r)
    lambda %= PI2 if lambda < 0
    return [lambda, phi, r]
  rescue => e
    raise
  end

  def self.pol2rect(pol, r)
    lambda, phi = pol
    mtx = r_y(lambda)
    mtx = r_z(phi, mtx)
    return rotate(mtx, [r, 0.0, 0.0])
  rescue => e
    raise
  end
end
