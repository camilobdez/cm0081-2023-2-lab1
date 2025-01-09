# Automata and Formal Languages - Programming Lab 1

## Testing Regular Expressions Matching

### Collaborators

- [Camilo Bermúdez](https://www.github.com/camilobdez)
- [Luis Baena](https://www.github.com/alejobaenam)

### System and Tool Versions

- Windows 11 Home, Version	22H2
- GHC 9.6.2
- HUnit 1.6.20
- regex-posix
- regex-tdfa
- cabal 3.10.1.0

## Project Structure
- **Main File:** `src/RegexMatchTest.hs`  
- **Executable Name:** `match-test`  

## Assignment Description
This project implements unit tests for two Haskell regex libraries: **regex-posix** and **regex-tdfa**. The unit tests are written using the **HUnit** library and aim to test various regex patterns and operators, including:
- `*`: Zero or more repetitions
- `+`: One or more repetitions
- Pattern combinations (e.g., `a*ba*c*`)

### Features
1. **Unit Tests:**  
   - Written in `src/RegexMatchTest.hs` using `HUnit`.
   - Covers 10 test cases using regex patterns in both libraries.
2. **Regex Libraries:**  
   - `regex-posix`
   - `regex-tdfa`
3. **Compiler Options:**  
   - `-Werror`
   - `-Wall`
   - `-Wmissing-local-signatures`

## How to Build and Run

### Steps
1. Clone the repository:
```bash
  git clone https://github.com/camilobdez/cm0081-2023-2-lab1.git
  cd cm0081-2023-2-lab1
```

2. Build the project:
```bash
  cabal build
```

3. Run the tests:
```bash
  cabal run
```

4. Expected output:
A summary of the test results showing the number of passed, failed, and total test cases.

## Test Coverage

### regex-posix
- **5 unit tests** covering standard regex patterns.
- **Examples:**
  - Matching `'ab'` with `a*b`
  - Ensuring `'c'` does not match `a*b`

### regex-tdfa
- **5 additional unit tests** using the same patterns as `regex-posix`.
- **Examples:**
  - Matching `'abc'` with `a+b+c*`
  - Ensuring `'def'` does not match `a+b+c*`

## Acknowledgments
Special thanks to:
- **Andrés Sicard-Ramírez** for the course material and guidance.
- Contributors of the **HUnit**, **regex-posix**, and **regex-tdfa** libraries.
