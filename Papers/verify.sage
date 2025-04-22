def L(tup):
    a, b, c, d, e, f, g, h = tup
    return matrix(8, [[a, -b, -c, -d, -e, -f, -g, -h],
                      [b, a, -d, c, -f, e, h, -g],
                      [c, d, a, -b, -g, -h, e, f],
                      [d, -c, b, a, -h, g, -f, e],
                      [e, f, g, h, a, -b, -c, -d],
                      [f, -e, h, -g, b, a, d, -c],
                      [g, -h, -e, f, c, -d, a, b],
                      [h, g, -f, -e, d, c, -b, a]])

def R(tup):
    p, q, r, s, t, u, v, w = tup
    return matrix(8, [[p, -q, -r, -s, -t, -u, -v, -w],
                      [q, p, s, -r, u, -t, -w, v],
                      [r, -s, p, q, v, w, -t, -u],
                      [s, r, -q, p, w, -v, u, -t],
                      [t, -u, -v, -w, p, q, r, s],
                      [u, t, -w, v, -q, p, -s, r],
                      [v, w, t, -u, -r, s, p, -q],
                      [w, -v, u, t, -s, -r, q, p]])

def is_magic(M):
    n = M.nrows()
    gamma = sum(M[0, i]^2 for i in range(n))
    d1 = sum(M[i, i]^2 for i in range(n))
    d2 = sum(M[i, n-1-i]^2 for i in range(n))
    return d1 == d2 == gamma and M*M.transpose() == matrix.diagonal(n, (gamma,)*n)

def is_proper(M):
    l = M.list()
    for j, y in enumerate(l):
        for x in l[:j]:
            if x == y or x == -y:
                return False
    return True

# Matrix in Theorem 3
ah = (2, 1, 1, 4, 2, 1, 1, -2)
pw0 = (-7, -55, -11, 1, -27, -13, -19, 4)

M0 = L(ah)*R(pw0)
print(is_proper(M0), is_magic(M0))

# Matrix in Theorem 4
_.<q, r, t, u> = QQ[]
X = (7*q^2 + 7*r^2 + 21*q*t - 7*r*t + 34*t^2 - 7*q*u - 21*t*u + 4*u^2
     + 7*q + 21*r - 7*u + 34)
pw1 = 3*(t^2 - 1)*u/(2*X), q, r, 1, t, u-q-3*t-1, -r+t-3, (u^2 - X)/(2*u)

M1 = L(ah)*R(pw1)
print(is_proper(M1), is_magic(M1))

# Matrix from Section 3.2
ah2 = (0, 1, 1, 1, 1, 1, -1, 5)
pw2 = (45, -30, -60, 75, 90, 13, -14, -69)
M2 = L(ah2)*R(pw2)
print(is_proper(M1), is_magic(M1))
