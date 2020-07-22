# Aggregatable Subvector Commitments for Stateless Cryptocurrencies

This repo has both the SCN 2020 "camera-ready" version of the paper and the IACR Cryptology ePrint version (which is posted [here](http://eprint.iacr.org/2020/527)).

You can use the `build-camera-ready.sh` script to generate the camera-ready version in `camera-ready/main.pdf`, which you can open with your favorite PDF viewer.

For the ePrint version, just do a `make` and then open `main.pdf` with your favorite PDF viewer.

## Errata

In section 3.4.2, in "The $i\ne j$ Case", at some point the text says: $W_{i,j}(X) = c_i \frac{1}{X-\omega^i} + c_j \frac{1}{X-\omega_j}$.
This is an unfortunate typo.
The correct form is $W_{i,j}(X) = A(X) \left(c_i \frac{1}{X-\omega^i} + c_j \frac{1}{X-\omega_j}\right) = c_i \frac{A(X)}{X-\omega^i} + c_j \frac{A(X)}{X-\omega_j}$.
