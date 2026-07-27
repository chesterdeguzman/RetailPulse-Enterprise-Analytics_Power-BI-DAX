# OPEN FIRST - How to Run RetailPulse Enterprise Analytics

## Requirements
- Windows 10/11 or macOS
- Power BI Desktop (latest version)
- Git (optional)

## Step 1: Download
Extract `RetailPulse-Enterprise-Analytics-GitHub.zip` to any folder.

Example:
`C:\Projects\RetailPulse-Enterprise-Analytics`

## Step 2: Open the project
Open the folder and double-click:

`Dashboard/RetailPulse.pbip`

If Windows asks which app to use, choose **Power BI Desktop**.

## Step 3: Configure data paths
Open PowerShell in the project root and run:

```powershell
./scripts/configure_project.ps1
```

Or, if you have Python installed:

```bash
python scripts/configure_project.py
```

## Step 4: Refresh data
In Power BI Desktop:
- Home → Refresh
- Wait for all tables to load.

## Step 5: Save
Save the project once. From then on, it can be committed to GitHub normally.

## Publishing (Optional)
- Publish to your Power BI Service workspace.
- Share or embed the report as needed.

## Repository Structure
- Dashboard/ → Power BI project
- Data/ → CSV datasets
- DAX/ → Measures
- SQL/ → SQL scripts
- Documentation/ → Design and data dictionary
- Images/ → Screenshots
