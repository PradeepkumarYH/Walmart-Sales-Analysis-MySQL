# GitHub Upload Instructions
## How to Push This Project to GitHub

Follow these steps exactly, in order.

---

### STEP 1: Create a New Repository on GitHub

1. Go to https://github.com and log in.
2. Click the **"+"** icon (top right) → **"New repository"**.
3. Fill in the details:
   - **Repository name:** `walmart-sales-analysis`
   - **Description:** `End-to-end Walmart sales data analysis using MySQL — schema design, feature engineering, and EDA.`
   - Set visibility to **Public**
   - **Do NOT** initialise with a README (you already have one)
4. Click **"Create repository"**.
5. Copy the repository URL shown (e.g., `https://github.com/YOUR_USERNAME/walmart-sales-analysis.git`)

---

### STEP 2: Set Up Git on Your Local Machine

Open your terminal (Command Prompt, Git Bash, or Terminal on Mac/Linux).

**Check if Git is installed:**
```bash
git --version
```
If not installed, download it from https://git-scm.com/downloads

**Configure your Git identity (first time only):**
```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

---

### STEP 3: Navigate to Your Project Folder

```bash
# Replace the path below with the actual path to your project folder
cd /path/to/walmart_sales_analysis

# Verify your files are present
ls
# Expected output:
# 01_schema_setup.sql
# 02_feature_engineering.sql
# 03_eda_queries.sql
# README.md
```

---

### STEP 4: Initialise the Local Git Repository

```bash
git init
```
This creates a hidden `.git` folder — your local repository tracker.

---

### STEP 5: Stage All Project Files

```bash
git add .
```
This stages all files in the folder for your first commit.

**Verify what's staged:**
```bash
git status
```
You should see all four files listed under "Changes to be committed" in green.

---

### STEP 6: Create Your First Commit

```bash
git commit -m "Initial commit: Add schema, feature engineering, EDA scripts, and README"
```

---

### STEP 7: Rename the Default Branch to `main`

```bash
git branch -M main
```

---

### STEP 8: Connect to Your GitHub Remote Repository

```bash
# Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/walmart-sales-analysis.git
```

---

### STEP 9: Push to GitHub

```bash
git push -u origin main
```

You may be prompted to log in to GitHub. Use your username and a **Personal Access Token (PAT)** as the password (GitHub no longer accepts plain passwords).

**How to create a PAT:**
1. Go to GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token"
3. Select scope: `repo`
4. Copy the token and use it as your password when prompted

---

### STEP 10: Verify Your Upload

Go to `https://github.com/YOUR_USERNAME/walmart-sales-analysis` in your browser.

You should see all four files and your formatted README displayed on the repository homepage. ✅

---

### Future Updates (After Making Changes)

Whenever you update or add files, use this workflow:

```bash
git add .
git commit -m "Brief description of what you changed"
git push
```
