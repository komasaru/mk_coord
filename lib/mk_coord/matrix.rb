module MkCoord
  module Matrix
    module_function

    #=========================================================================
    # 回転行列（x 軸中心）
    #
    # @param:  phi  (回転量(rad))
    # @param:  r    (回転行列)
    # @return: r_a  (回転後)
    #=========================================================================
    def r_x(phi, r = R_UNIT)
      r_a = Array.new

      begin
        s, c = Math.sin(phi), Math.cos(phi)
        a10 =   c * r[1][0] + s * r[2][0]
        a11 =   c * r[1][1] + s * r[2][1]
        a12 =   c * r[1][2] + s * r[2][2]
        a20 = - s * r[1][0] + c * r[2][0]
        a21 = - s * r[1][1] + c * r[2][1]
        a22 = - s * r[1][2] + c * r[2][2]
        r_a << r[0]
        r_a << [a10, a11, a12]
        r_a << [a20, a21, a22]
        return r_a
      rescue => e
        raise
      end
    end

    #=========================================================================
    # 回転行列（y 軸中心）
    #
    # @param:  theta  (回転量(rad))
    # @param:  r      (回転行列)
    # @return: r_a    (回転後)
    #=========================================================================
    def r_y(theta, r = R_UNIT)
      r_a = Array.new

      begin
        s, c = Math.sin(theta), Math.cos(theta)
        a00 = c * r[0][0] - s * r[2][0]
        a01 = c * r[0][1] - s * r[2][1]
        a02 = c * r[0][2] - s * r[2][2]
        a20 = s * r[0][0] + c * r[2][0]
        a21 = s * r[0][1] + c * r[2][1]
        a22 = s * r[0][2] + c * r[2][2]
        r_a << [a00, a01, a02]
        r_a << r[1]
        r_a << [a20, a21, a22]
        return r_a
      rescue => e
        raise
      end
    end

    #=========================================================================
    # 回転行列（z 軸中心）
    #
    # @param:  psi  (回転量(rad))
    # @param:  r    (回転行列)
    # @return: r_a  (回転後)
    #=========================================================================
    def r_z(psi, r = R_UNIT)
      r_a = Array.new

      begin
        s, c = Math.sin(psi), Math.cos(psi)
        a00 =   c * r[0][0] + s * r[1][0];
        a01 =   c * r[0][1] + s * r[1][1];
        a02 =   c * r[0][2] + s * r[1][2];
        a10 = - s * r[0][0] + c * r[1][0];
        a11 = - s * r[0][1] + c * r[1][1];
        a12 = - s * r[0][2] + c * r[1][2];
        r_a << [a00, a01, a02]
        r_a << [a10, a11, a12]
        r_a << r[2]
        return r_a
      rescue => e
        raise
      end
    end

    #=========================================================================
    # 座標回転
    #
    # @param:  r      (回転行列)
    # @param:  pos    (回転前直角座標)
    # @return: pos_r  (回転後直角座標)
    #=========================================================================
    def rotate(r, pos)
      return (0..2).map do |i|
        (0..2).inject(0) { |sum, j| sum + r[i][j] * pos[j] }
      end
    rescue => e
      raise
    end
  end
end

