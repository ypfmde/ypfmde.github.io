# Formally compute W
var('x n')
P = (1+x^(4*n-1))*(1+x^(2*n))*(1-x^(2*n+1))
Q = (1+x^(2*n+1))*(1-x^(2*n+2))
V = P*Q^2*P.diff(x,2)+(P*Q.diff(x))^2-P^2*Q*Q.diff(x,2)-(P.diff(x)*Q)^2
a = 1024*n^2 - 4096/3*n + 320
b = 12288*n^3 - 14336*n^2 + 4864/3*n + 256
W = V - (2*n + 1)^2 *(n + 1)^2*x^(24*n-1)*(1-x)^4*(a*x + b*(1-x))

# Compute the pairs (i,j) for the exponents ni+j of W, and the
# corresponding coefficients a_ij. Somewhat clumsy, as I don't know how
# to deal with polynomials where exponents are symbolic expressions.
#
# l is the list of summands of W
l = [z.canonicalize_radical() for z in W.expand().operands()]
aij = {}
for term in l:
    c = term(x=1)                     # get coefficient of term
    e = (term.diff(x)/c)(x=1)         # get exponent of term
    i, j = ZZ(e.diff(n)), ZZ(e(n=0))  # Clumsy method to compute pairs (i,j)
    aij[i,j] = aij[i,j] + c if (i,j) in aij else c

# Check if the pairs (i,j) and coefficients aij[i,j] were correctly computed
Wnew = sum(c*x^(n*i+j) for (i,j),c in aij.items())
print (W-Wnew).canonicalize_radical().is_trivial_zero()

# compute the coefficients of W(x)/(1-x)^6
var('y o')
trouble = []
aijk = aij.keys()
aijk.sort()
for k in range(len(aijk)-1):
    (i,j) = aijk[k]
    # f(n,y) is the coefficient of x^(ni+j+y) for 0 <= y < yr
    f = sum(aij[z]*binomial(n*i+j+y-n*z[0]-z[1]+5,5) for z in aijk[:k+1])
    (ii,jj) = aijk[k+1] # successor of (i,j)
    yr = n*(ii-i)+(jj-j)
    # check non-negativity of the polynomial f
    if yr == 1:
        # Checks if the coefficient of x^(ni+j), which is a
        # polynomial in n, has nonnegative coefficients upon replacing
        # n with n+6
        f = f(n=n+6,y=0).polynomial(QQ)
        if min(f.coefficients()+[0]) < 0:
            print "False"
            break
    else:
        # The coefficient of x^(ni+j+y), which is a polynomial in n and y,
        # has to be nonnegative for 0 <= y < yr, so y = yr-1-o for
        # non-negative o. Here yr has the form 2n-e for an integer e. Thus
        # y = 2n-e-1-o. So upon replacing n with (y+1+o+e)/2,
        # we get a polynomial in y and o which has to be nonnegative
        # for all y and o. In most cases, this holds because the
        # coeffcients are non-negative.
        if ii-i != 2:
            print "False"
        e = j-jj
        f = f(n=(y+1+o+e)/2).polynomial(QQ)
        if min(f.coefficients()+[0]) < 0:
            trouble.append(f)

# Finally, take care of the only case which requires an ad hoc argument
print len(trouble) == 1

f = 60*trouble[0]
d = 15*y^2 + 165*y + 895/2
e = 4*y^6 + 145*y^5 + 2065*y^4 + 15165*y^3 + 62146*y^2 + 139115*y + 550631/4
r = 2*o^2*y^5 + 2*y^7 + 60*o^2*y^4 + 85*y^6 + 770*o^2*y^3 + 1574*y^5 + 5*o^4 + 5280*o^2*y^2 + 16460*y^4 + 19208*o^2*y + 104818*y^3 + 29275*o^2 + 405315*y^2 + 878146*y + 819480
print min(e.polynomial(QQ).coefficients()+r.polynomial(QQ).coefficients()) >= 0
# pos is positive
pos = o*((o^2-d)^2+e)+r
print (f-pos).expand().is_trivial_zero()
