F.<w> = GF(8, modulus=[1, 1, 0, 1])
l = {0, 2, 8, 17, 19, 20, 22, 25, 28, 33, 35, 41, 53, 55, 61}
a = matrix(F, 8, [1 if z in l else 0 for z in range(64)])
b = matrix.diagonal(F, [w^z for z in [4, 3, 3, 1, 6, 4, 4, 3]])
e = matrix.identity(F, 8)
assert MatrixGroup([a, b]).structure_description() == '3D(4,2)'
x = b*(a^2*b^2*a)^2*b^-2*a*b^-2
t = a^-3*b*(b*a)^2*b^-2*a^2*b
y = t^-1*x*t                                   # one part of (1)
s = a*b^-1*a*b
d = x*s*y*s*a*y*s^2*t
assert d^-1*x*d == y*x                         # other part of (1)
assert y^-1*x*y == x^-1                        # (2)
assert x^2 == y^2                              # (3)
assert s != e and s^13 == e                    # (4)
assert y^-1*s*y == s^8                         # (5)
S = [s^i for i in range(13)]
Y = [y^i for i in range(4)]
H = [u*v for u in S for v in Y]
assert x not in H                              # (6)
assert all(h in Y or (h*x)^13 == e for h in H) # (7)
print('All claims verified')
