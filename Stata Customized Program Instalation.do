
	/*-------------------------------------------------------------------------------
	*                  Stata Customized Program Installer
	*-------------------------------------------------------------------------------
	* AUTHOR	  :  Md. Redoan Hossain Bhuiyan
	* EMAIL		  :  redoanhossain630@gmail.com
	* PHONE		  :  +8801675735811
	* LOCATION	  :  Dhaka, Bangladesh
	* DATE		  :  12th July, 2025
	* LAST UPDATE :  27th August, 2025
	*-------------------------------------------------------------------------------
	
	PURPOSE:
			This program installs a suite of custom Stata tools designed to enhance 
			data quality assurance and streamline data processing workflows. These tools 
			provide specialized functionality for:
				- Optimal counts analysis
				- Bias detection
				- Automated codebook generation
				- Open-ended response handling
				- Input correction (String) 
				- Outlier detection (Numeric)
				- Batch table exportation (for all or selected-variables)

		    The tools are free to use and will be permanently available after installation.


	*-------------------------------------------------------------------------------
	*                  DATA QUALITY TOOLS DESCRIPTION
	*-------------------------------------------------------------------------------

	 1. optcounts - Special Value Tracker
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Tracks frequency of user-defined special values (e.g., -99, 99, -999 -96)
	 Features:
	   - Counts occurrences per enumerator/variable
	   - Identifies prevalence of specific codes for both string & bytes
	   - Generates a descriptive table of number of survey along with the count of given codes.
	   
	 
	 2. detectoutlier - Outlier Detection Tool
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Identifies outliers in numeric variables
	 Features:
	   - Uses mean ± k standard deviations method
	   - Auto-checks all numeric variables when none specified
	   - Exports to Excel with:
	     • Variable names/labels
	     • Outlier values
	     • Minimum and Maximum value
	
	 3. exportopenended - Text Response Exporter
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Exports open-ended responses to Excel
	 Output Structure (long format):
	   1. ID variable (default key)
	   2. Original variable name
	   3. Text response (data)
	   4. Empty column for translations


	 4. inputcorrection - Text Correction Processor
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Applies corrected text values from Excel to Stata datasets
	 Features:
	   - Updates open-ended/text responses
	   - Processes post-fieldwork edits
	   - Handles translations


	 5. codebookgen - Automated Codebook Generator
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Creates professional dataset documentation
	 Features:
	   - Excel format output
	   - Includes:
	     • Variable labels
	     • Value labels
	     • Characteristics
	     • Missing value statistics


	 6. biascheck - Enumerator Bias Detector
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose: Identifies potential enumerator bias in survey responses
	 Features:
	   - Analyzes ordinal/Likert-scale questions
	   - Generates frequency distribution tables
	   - Shows enumerator deviations from overall trends
	 
	 
	 7. exporttabs - Batch Table Exporter
	 `````````````````````````````````````````````````````````````````````````````
	 Purpose:  Automates exporting frequency and cross-tabulation tables to Excel for all variables of any dataset
	 Features:  
	   - Exports one-way frequency tables for all or selected variables  
	   - Creates two-way cross-tabulations using the `by()` option  
	   - Supports standard tabulate options via `tabopt()` (row, col, cell, nofreq, etc.)  
	   - Automatically generates percentages (rounded to 2 decimals)  
	   - Works with labeled and unlabeled categorical variables  
	   - Outputs directly to Excel (new file, replaces if existing)  
	   - Produces clean, plain tables (user can style further in Excel)  
	   - Useful for batch processing many variables quickly  
	*-------------------------------------------------------------------------------*/


	*-------------------------------------------------------------------------------
	*                  TOOL INSTALLATION SECTION
	*-------------------------------------------------------------------------------

	display _n(1)
	display "Starting installation process..."
	display "Please wait while tools are being installed..."

	// Installation commands with progress feedback
	local tools optcounts biascheck codebookgen exportopenended inputcorrection detectoutlier exporttabs
	local i 1

	foreach tool of local tools {
		display _n(1)
		display "Installing `tool' (Tool `i' of 7)..."
		
		cap ado uninstall `tool'
		net install `tool', from("https://raw.githubusercontent.com/RanaRedoan/`tool'/main") replace
		help `tool'
		
		local ++i
	}


display "INSTALLATION COMPLETED SUCCESSFULLY"
display "For support, bug reports, or feature requests, please contact to the author"





