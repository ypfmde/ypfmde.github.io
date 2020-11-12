# f(X) and g(X) are defined over Q(a), where a=alpha is a root of d below

d = x^16 + 3849128*x^14 + 3651526264636*x^12 - 100871140982626600*x^10 +\
    572258643052776938854*x^8 - 220379747972248322684331496*x^6 +\
    3004910964282710898635268610684*x^4 -\
    18012936875420035607572521868312*x^2 +\
    3278264047813522338991318347055048319329

# First we verify algebraically that f(g(X)) has rational coefficients:

k.<alpha> = NumberField(d)
a = alpha
K.<X> = k[]
K = K.fraction_field()
load("eremenko_data.sage")     # Load f(X) and g(X)
fg = f(X=g)                    # Compose f and g
fgr = (-1/3*X^9 + X^8 - 5/4*X^7 + 3/2*X^6 + 15/16*X^5 - 25/16*X^4 + 221/64*X^3 - 71/32*X^2 + 463/256*X - 15/32)/(X^8 - 2*X^7 + 17/4*X^6 - 37/8*X^5 + 39/8*X^4 - 99/32*X^3 + X^2 - 5/32*X - 319/768)
# fgr is a rational function with rational coefficients
print "f(g(x)) has rational coefficients:", fg ==fgr

# Now we work numerically:

S.<X> = CC[]
S = S.fraction_field()
# Pick the right complex embedding of alpha
a = [z for z in alpha.complex_embeddings() if abs(93+140*I-z)<1][0]
a = S(a) # Embed a in S, for the sake of faster calculation
load("eremenko_data.sage") # Load f(X) and g(X)
p = list_plot([g(X=z) for z in srange(-100,100,0.02)],plotjoined=True)
p.set_aspect_ratio(1)
p.show()
