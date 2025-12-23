################ Helper functions ################

def is_magic(M):
    n = M.nrows()
    gamma = sum(M[0, i]^2 for i in range(n))
    d1 = sum(M[i, i]^2 for i in range(n))
    d2 = sum(M[i, n-1-i]^2 for i in range(n))
    return d1 == d2 == gamma and M*M.transpose() == gamma*matrix.identity(n)

def is_proper(M):
    entries = M.list()
    for j, y in enumerate(entries):
        for x in entries[:j]:
            if x == y or x == -y:
                return False
    return True

def L(tup): # Left multiplication matrix for octonions
    a, b, c, d, e, f, g, h = tup
    return matrix([(a, -b, -c, -d, -e, -f, -g, -h),
                   (b, a, -d, c, -f, e, h, -g),
                   (c, d, a, -b, -g, -h, e, f),
                   (d, -c, b, a, -h, g, -f, e),
                   (e, f, g, h, a, -b, -c, -d),
                   (f, -e, h, -g, b, a, d, -c),
                   (g, -h, -e, f, c, -d, a, b),
                   (h, g, -f, -e, d, c, -b, a)])

def R(tup): # Right multiplication matrix for octonions
    p, q, r, s, t, u, v, w = tup
    return matrix([(p, -q, -r, -s, -t, -u, -v, -w),
                   (q, p, s, -r, u, -t, -w, v),
                   (r, -s, p, q, v, w, -t, -u),
                   (s, r, -q, p, w, -v, u, -t),
                   (t, -u, -v, -w, p, q, r, s),
                   (u, t, -w, v, -q, p, -s, r),
                   (v, w, t, -u, -r, s, p, -q),
                   (w, -v, u, t, -s, -r, q, p)])

################ Verifications ################

# Euler's matrix from the introduction:
euler = matrix([(68, -29, 41, -37),
                (-17, 31, 79, 32),
                (59, 28, -23, 61),
                (-11, -77, 8, 49)])
print(is_magic(euler) and is_proper(euler))

# Matrix in Theorem 1.3
ah = (2, 1, 1, 4, 2, 1, 1, -2)
pw_3 = (-7, -55, -11, 1, -27, -13, -19, 4)
M_3 = L(ah)*R(pw_3)
print(is_proper(M_3) and is_magic(M_3))

# Matrix in Theorem 1.4
_.<q, r, t, u> = QQ[]
X = (7*q^2 + 7*r^2 + 21*q*t - 7*r*t + 34*t^2 - 7*q*u - 21*t*u + 4*u^2
     + 7*q + 21*r - 7*u + 34)
pw_4 = (3*(t^2 - 1)*u/(2*X), q, r, 1, t, u-q-3*t-1, t-r-3, (u^2 - X)/(2*u))
M_4 = L(ah)*R(pw_4)
print(is_proper(M_4) and is_magic(M_4))

# R(...) in Theorem 1.3 is specialization of R(...) from Theorem 1.4
dic = {q: -55, r: -11, t: -27, u: -148}
print(pw_3 == tuple(z.subs(dic) for z in pw_4))

# Matrix from Section 3.2
ah = (0, 1, 1, 1, 1, 1, -1, 5)
pw = (45, -30, -60, 75, 90, 13, -14, -69)
M = L(ah)*R(pw)
print(is_proper(M) and is_magic(M))

# Magic and almost proper matrices from Section 4
M5_1 = matrix([(-106, -32, -8, -75, -50),
               (-4, -38, -120, 58, -35),
               (24, 20, -73, -88, 80),
               (61, 66, -16, -46, -100),
               (70, -115, 20, -40, -18)])
M5_2 = matrix([(4, 3, 40, -94, -142),
               (-29, -128, -90, 44, -58),
               (154, 28, -35, 56, -42),
               (74, -82, -10, -114, 73),
               (-24, 82, -140, -61, 2)])
M5_3 = matrix([(-204, -38, 10, -11, -312),
               (54, -262, -260, 36, -13),
               (-84, 102, -165, -306, 48),
               (291, 102, -40, -56, -202),
               (66, -223, 210, -206, -2)])
M5_4 = matrix([(29, -218, -370, -188, 180),
               (88, -384, 22, 158, -269),
               (-160, 58, -40, -333, -334),
               (210, -139, 304, -286, 124),
               (418, 188, -147, -4, -146)])
M5_5 = matrix([(-392, -336, -21, 282, 210),
               (177, -384, -24, -392, 240),
               (408, -186, -246, 357, -40),
               (-48, -309, 176, -42, -510),
               (-192, 14, -546, -168, -165)])
for M in [M5_1, M5_2, M5_3, M5_4, M5_5]:
    print(is_magic(M) and len({z^2 for z in M.list()}) == 24)
