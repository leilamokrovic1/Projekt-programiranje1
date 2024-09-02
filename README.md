# Skladovni avtomati

## Matematična definicija
Skladovni avtomat je definiran kot nabor sedmih spremenljivk, na sledeč način $M=(Q, \Sigma, \Gamma, \delta, q_{0}, Z, F)$ kjer::


- $Q$ je končna množica stanj
- $\Sigma$ je končna množica, imenovana vhodna abeceda
- $\Gamma$ je končna množica, imenovana skladovna abeceda
- $\delta$ je končna podmnožica $Q \times (\Sigma \cup \{\varepsilon\}) \times \Gamma \times Q \times \Gamma^{*}$, prehodna relacija
- $q_{0} \in Q$ je začetno stanje
- $Z \in \Gamma$ je začetni simbol sklada
- $F \subseteq Q$ je množica sprejemajočih stanj
