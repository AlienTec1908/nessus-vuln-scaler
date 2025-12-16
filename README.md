# 🚀 Nessus Scans scale v1.0

<p align="center">
  <img src="cover.png" alt="agent-image-ripper cover" width="50%" style="height: 20rem;">
</p>

Tired of drowning in endless Nessus CSV reports? This is your lifeboat. A pragmatic, zero-dependency PowerShell pipeline to turn vulnerability chaos into actionable clarity.

---

### ✨ Core Features

*   **⚙️ Automated Triage:** Ingests multiple raw Nessus CSV files and instantly filters out the noise, focusing only on actionable CVEs.
*   **📊 Smart Categorization:** Automatically sorts vulnerabilities into logical groups (Windows vs. Linux/Apps), telling you which team is responsible for what.
*   **🔗 Host-Vulnerability Pivot:** Transforms data from a host-centric view to a vulnerability-centric one, answering the most critical question: *"Which systems are affected by this specific vulnerability?"*
*   **🎨 Color-Coded Prioritization:** Translates complex risk levels into a simple, intuitive, color-coded list. See what's critical (🔴) and what's high-priority (🟡) in seconds.
*   **🛡️ Zero Dependencies:** Pure, battle-tested PowerShell. No libraries, no complex setup. It just works.

###  philosophy: The "Why" Behind the "How"

This tool wasn't built in a lab. It was forged in the trenches of corporate IT, born from the pain of manually processing thousands of vulnerability findings week after week.

It doesn't follow a textbook. It follows a single, ruthless principle: **Get the job done.**

The methods are direct and pragmatic because the real world is messy. While other complex parsers fail with the slightest format change, this tool's robust, fundamental approach has proven its worth in the field. It’s not about elegance. It’s about reliability.

### 🛣️ From Chaos to Clarity: The 3-Step Pipeline

This isn't just one script; it's a complete, automated workflow in three modules that run sequentially.

#### **Module 1: The Aggregator**
Takes your raw, chaotic data dumps from one or more scans and transforms them into a single, clean, and categorized list. It's the first filter that reduces thousands of lines to the few hundred that actually matter.

#### **Module 2: The Correlation Engine**
This is the analytical core. It pivots the data to create a master list of unique vulnerabilities and provides a clear overview of every single host affected by each one. No more guessing. Just facts.

#### **Module 3: The Triage Visualizer**
The final step translates the technical findings into a language everyone understands. It delivers a simple, color-coded priority list directly in your terminal. This is the "at-a-glance" view that tells you where the fire is hottest.

### 🎯 How to Use

The pipeline is designed to be as automated as possible.

1.  **Run Module 1.** The script will create a `\Nessusscans\` directory on your Desktop.
2.  Create a subfolder and place all your raw `.csv` Nessus scan files inside it.
3.  Provide the path to this folder when prompted.
4.  The script will generate the first output file (`Nessus - Schwachstellenliste mit Hosts sortiert.txt`).
5.  **Run Module 2.** It will automatically pick up the file from Module 1 and generate the detailed analysis (`Auswertung.txt`).
6.  **Run Module 3.** It will automatically read the analysis file from Module 2 and display the final, color-coded priority list.

### 🔮 What's Next? The Road to v2.0

Version 1.0 is a powerful, battle-tested foundation. It solves the core problem beautifully. But this is just the beginning.

Imagine a future where this pipeline evolves to include:
*   **Management-Ready HTML & PDF Dashboards**
*   **Advanced Risk Scoring** based on asset criticality.
*   **Automated Ticket Generation** for JIRA, ServiceNow, and other platforms.
*   **A modular Pro-Version** that can be customized and integrated via APIs.

This is the vision. **Nessus Scans scale v1.0** is the first, powerful step.

### 📜 Disclaimer

This tool is designed to assist IT and security professionals in their daily workflow. Always validate findings with the original scan data. The author is not responsible for any actions taken based on the output of this tool.
