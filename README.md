# VQE Hardware-Efficient Ansatz

> **Category**: optimization &nbsp;|&nbsp; **Difficulty**: advanced &nbsp;|&nbsp; **Qubits**: 4 &nbsp;|&nbsp; **Gates**: 19 &nbsp;|&nbsp; **Depth**: 8

The Variational Quantum Eigensolver (VQE) finds the ground-state energy of a Hamiltonian by optimising the parameters of a parameterized quantum circuit (ansatz). This circuit implements a 2-layer hardware-efficient ansatz with Ry + Rz rotations and a linear CNOT entanglement layer. Parameters shown are example values; a classical optimiser (e.g., COBYLA, ADAM) minimises ⟨ψ(θ)|H|ψ(θ)⟩ with respect to θ.

## Expected Output

Parameterized state; run classically with VQE optimizer to find ground state

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
OPENQASM 2.0;
include "qelib1.inc";
// VQE hardware-efficient ansatz: 4 qubits, 2 layers of Ry-Rz + linear CNOT
// Parameters are example values (not optimised for any specific Hamiltonian)
qreg q[4];
creg c[4];
// Layer 1: single-qubit rotations
ry(0.5) q[0]; ry(1.2) q[1]; ry(0.8) q[2]; ry(0.3) q[3];
rz(0.1) q[0]; rz(0.7) q[1]; rz(1.1) q[2]; rz(0.4) q[3];
// Layer 1: entanglement (linear CNOT chain)
cx q[0],q[1]; cx q[1],q[2]; cx q[2],q[3];
// Layer 2: single-qubit rotations
ry(0.9) q[0]; ry(0.4) q[1]; ry(1.5) q[2]; ry(0.6) q[3];
rz(0.3) q[0]; rz(0.8) q[1]; rz(0.2) q[2]; rz(1.0) q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
```

## Tags

`vqe` `variational` `ansatz` `quantum-chemistry` `optimization`

## References

- [Peruzzo et al. (2014). A Variational Eigenvalue Solver on a Photonic Chip. Nature Communications 5, 4213](https://doi.org/10.1038/ncomms5213)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
