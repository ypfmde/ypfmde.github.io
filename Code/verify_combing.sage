#### Verifying Theorem 1.2 ####

R.<a, b, c, d, X, Y, Z> = QQ[]
           
m1 = (-2*a*b*c + a^2 - b^2)*Y + (a^2*c - b^2*c + 2*a*b)*Z
m2 = ((a*b*c - a^2 + c^2 + 1)*X + (b*c^2 + a*c + 2*b)*Y
      + (-a*c^2 + b*c - 2*a)*Z - a*c*d)
m3 = ((-a^2*c + c^3 - a*b + c)*X + (2*a*c^2 + b*c + a)*Y
      + (2*b*c^2 - a*c + b)*Z + a*d)
m4 = (-a^2*b*d - b^3*d)*Z + 2*a^2*b*c - a^3 + a*b^2
m5 = ((a*b^2*d + b*c*d - a*d)*X + (b^2*c*d - 2*a*b*d)*Y
      + (-a*b*c*d + a^2*d + b^2*d)*Z - a^3*b + a*b^3 + a*b*c^2 - a^2*c)
m6 = ((a^2*b*d + b*c^2*d - a*c*d)*X + (-a^2*d)*Y
      + (2*b^2*c*d - a*b*d)*Z + 2*a^2*b^2 - a*b*c + a^2)

M = matrix([[X, Y, Z], [m1, m2, m3], [m4, m5, m6]])
delta = 2 * a^2 * (b^2 + c^2 + 1) * (2*a*b*c - a^2 + b^2)

assert M.det()%(X^2 + Y^2 + Z^2 - 1)%(a^2 + b^2 + c^2 + d^2 + 1) == delta

#### Verifying Theorem 1.3 ####

K.<w> = QuadraticField(-7)
R.<X, Y, Z> = K[]

M = matrix([
    [X, Y, Z],
    [w*Y - 5*Z, (2*w)*X + (-w)*Y + 8*Z + 3, -5*X + 5*Y + (4*w)*Z + w],
    [-6*Z + 1, (3*w)*X + w*Y + 9*Z + 1, -7*X + Y + (5*w)*Z]])

assert M.det()%(X^2 + Y^2 + Z^2 - 1) == 5

print('All tests passed!')
