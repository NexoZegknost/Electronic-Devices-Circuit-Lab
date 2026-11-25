# Electronic Devices & Circuit Lab – Project 3 (LTspice)

Migration of the six simulation labs of the *Electronic Device Component* lab manual from **PSpice for TI** to **LTspice** (Analog Devices).

| Lab | Topic | Original chapter |
|---|---|---|
| Lab 1 | First Project on LTspice | Ch.1 |
| Lab 2 | Diode Circuits Analysis | Ch.2 |
| Lab 3 | Bipolar Junction Transistor | Ch.3 |
| Lab 4 | Operational Amplifier | Ch.5 |
| Lab 5 | Field Effect Transistor | Ch.6 |
| Lab 6 | 24-Hour Project for Midterm | Ch.7 |

## Team

| Member | Student ID | Responsibility |
|---|---|---|
| Đỗ Việt Cường | 2510280 | Lab 1, Lab 2, PSpice → LTspice mapping table |
| Nguyễn Quốc Đạt | 2510287 | Lab 3, Lab 4, editing and packaging |
| Nguyễn Huỳnh Hữu Đức | 2510290 | Lab 5, Lab 6, offline installation guide |

## Repository layout

```
Manage/     team ruleset, task split, mapping-table plan, notation guide (Vietnamese)
Report/     LaTeX sources of all deliverables (see Report/README.md)
  manual.tex          Lab Manual (students)
  solutions.tex       Solutions (instructor)
  install_guide.tex   Offline installation guide
  report.tex          Project report (Part B)
  ltspice/LabN/       LTspice schematics: Lab1/Ex01.asc … Lab6/Adv02.asc
```

Not in the repository: the lecturer's course materials (`Docs/`) and the LTspice offline installer (`Setup/`, `LTspice64.msi` + library), which is delivered together with the report.

## Build

XeLaTeX + latexmk, output in `Report/build/`:

```
cd Report
latexmk              # all four PDFs
latexmk manual.tex   # one document
```

LTspice version used: **26.1.1** (Windows 10/11 x64).
