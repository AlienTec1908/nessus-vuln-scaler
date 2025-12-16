# 🚀 Nessus Scans Scale v1.0

<p align="center">
  <img src="cover.png" alt="Nessus Scans Scale" width="50%" style="height: 20rem;">
</p>

Tired of drowning in endless Nessus CSV reports?  
This is your lifeboat. A pragmatic, zero-dependency PowerShell pipeline to turn vulnerability chaos into actionable clarity.

![License](https://img.shields.io/badge/License-MIT-green.svg)
![Platform](https://img.shields.io/badge/Platform-Windows-blue.svg)
![PowerShell](https://img.shields.io/badge/PowerShell-Required-blue.svg)

---

## ✨ Core Features

- **Automated Triage**  
  Ingests multiple raw Nessus CSV files and filters out the noise, focusing only on actionable CVEs.

- **Smart Categorization**  
  Automatically separates Windows, Linux and application findings so responsibility is instantly clear.

- **Host–Vulnerability Pivot**  
  Converts host-centric data into a vulnerability-centric view:  
  *Which systems are affected by this CVE?*

- **Color-Coded Prioritization**  
  Critical and high-risk issues are highlighted directly in the terminal for instant triage.

- **Zero Dependencies**  
  Pure PowerShell. No modules, no installs, no friction.

---

## Philosophy – Why this tool exists

This tool wasn’t built in a lab.  
It was forged in real corporate environments where thousands of findings must be processed fast.

No theory. No beauty contests.  
One principle only:

**Get the job done.**

The approach is intentionally pragmatic.  
When other parsers break on minor format changes, this one keeps working.

Reliability beats elegance.

---

## 🛣️ From Chaos to Clarity – The 3-Step Pipeline

This project is a complete workflow consisting of three sequential modules.

### Module 1 – Aggregator
Combines one or more raw Nessus CSV exports into a single, cleaned and categorized list.  
Thousands of rows become a focused working set.

### Module 2 – Correlation Engine
Builds a master list of unique vulnerabilities and maps every affected host to each finding.

No guessing.  
No manual correlation.

### Module 3 – Triage Visualizer
Displays a concise, color-coded priority list directly in the console.  
This is the “where to start fixing” view.

---

## 🎯 How to Use

1. Run **Module 1**  
   A `Nessusscans` directory will be created on your Desktop.
2. Create a subfolder and place all Nessus `.csv` files inside.
3. Provide the folder path when prompted.
4. Output file is generated:  
   `Nessus - Schwachstellenliste mit Hosts sortiert.txt`
5. Run **Module 2**  
   Generates `Auswertung.txt`.
6. Run **Module 3**  
   Reads the analysis and prints the final prioritized list.

---

## 🔮 Roadmap – v2.0 Vision

Version 1.0 is intentionally raw and battle-tested.  
v2.0 goes further:

- Management-ready **HTML / PDF dashboards**
- **Advanced risk scoring** with asset criticality
- **Automatic ticket creation** (Jira, ServiceNow, etc.)
- Fully **modular Pro version** with API integration

v1.0 solves the pain.  
v2.0 scales the impact.

---

## 📜 Disclaimer

This tool supports security professionals in daily operations.  
Always validate results against original scan data.  
The author assumes no responsibility for actions taken based on the output.

---

## 📝 License

MIT License  
See the `LICENSE` file for details.
