module MkCoord
  module Trigonometric
    module_function

    #=========================================================================
    # λ の計算
    #
    # * λ = arctan((sinδ sinε + cosδ sinα cosε ) / cosδ cosα)
    #
    # @param:  alpha   (unit: rad)
    # @param:  delta   (unit: rad)
    # @param:  eps     (unit: rad)
    # @return: lambda  (unit: rad)
    #=========================================================================
    def compute_lambda(alpha, delta, eps)
      a = Math.sin(delta) * Math.sin(eps) \
        + Math.cos(delta) * Math.sin(alpha) * Math.cos(eps)
      b = Math.cos(delta) * Math.cos(alpha)
      lambda = Math.atan2(a, b)
      lambda %= PI2 if lambda < 0
      return lambda
    rescue => e
      raise
    end

    #=========================================================================
    # β の計算
    #
    # * β = arcsisn((sinδ cosε - cosδ sinα sinε )
    #
    # @param:  alpha   (unit: rad)
    # @param:  delta   (unit: rad)
    # @param:  eps     (unit: rad)
    # @return: lambda  (unit: rad)
    #=========================================================================
    def compute_beta(alpha, delta, eps)
      a = Math.sin(delta) * Math.cos(eps) \
        - Math.cos(delta) * Math.sin(alpha) * Math.sin(eps)
      return Math.asin(a)
    rescue => e
      raise
    end

    #=========================================================================
    # α の計算
    #
    # * α = arctan((-sinβ sinε + cosβ sinλ cosε ) / cosβ cosλ)
    #
    # @param:  lambda  (unit: rad)
    # @param:  beta    (unit: rad)
    # @param:  eps     (unit: rad)
    # @return: alpha   (unit: rad)
    #=========================================================================
    def compute_alpha(lambda, beta, eps)
      a = -Math.sin(beta) * Math.sin(eps) \
        +  Math.cos(beta) * Math.sin(lambda) * Math.cos(eps)
      b =  Math.cos(beta) * Math.cos(lambda)
      alpha = Math.atan2(a, b)
      alpha %= PI2 if a < 0
      return alpha
    rescue => e
      raise
    end

    #=========================================================================
    # δ の計算
    #
    # * δ = arcsisn((sinβ cosε + cosβ sinλ sinε )
    #
    # @param:  lambda  (unit: rad)
    # @param:  beta    (unit: rad)
    # @param:  eps     (unit: rad)
    # @return: delta   (unit: rad)
    #=========================================================================
    def compute_delta(lambda, beta, eps)
      a = Math.sin(beta) * Math.cos(eps) \
        + Math.cos(beta) * Math.sin(lambda) * Math.sin(eps)
      return Math.asin(a)
    rescue => e
      raise
    end
  end
end

