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
